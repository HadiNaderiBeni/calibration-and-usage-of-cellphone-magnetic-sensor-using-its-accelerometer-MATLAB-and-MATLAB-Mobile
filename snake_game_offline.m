function snake_game_offline(rawData, calib)
% Snake game controlled by calibrated + filtered accelerometer data

A = rawData.acc;
Acal = (calib.scale * (A' - calib.bias))';

% ---------------- FILTERING ----------------
fs = rawData.fs;
fc = 1.0;                          % cutoff frequency (Hz)
[b,a] = butter(2, fc/(fs/2));

ax = filtfilt(b,a, Acal(:,1));
ay = filtfilt(b,a, Acal(:,2));

% ---------------- GAME SETUP ----------------
gridSize = 20;
snake = [10 10];
food  = randi(gridSize,1,2);
score = 0;
gain  = 1;                         % control sensitivity

figure('Name','Snake Game – Calibrated Accelerometer');
axis([0 gridSize 0 gridSize]);
axis square; grid on; hold on;

for k = 1:length(ax)

    dir = sign(gain * [ax(k) ay(k)]);

    if all(dir==0)
        pause(0.05);
        continue;
    end

    newHead = snake(1,:) + dir;

    if any(newHead < 1) || any(newHead > gridSize)
        title('Game Over');
        break;
    end

    snake = [newHead; snake];

    if isequal(newHead, food)
        score = score + 1;
        food = randi(gridSize,1,2);
    else
        snake(end,:) = [];
    end

    cla;
    plot(snake(:,1),snake(:,2),'gs','MarkerFaceColor','g','MarkerSize',10);
    plot(food(1),food(2),'rs','MarkerFaceColor','r','MarkerSize',10);
    title(['Score: ',num2str(score)]);
    pause(0.05);
end

fprintf('Final score: %d\n', score);
end
