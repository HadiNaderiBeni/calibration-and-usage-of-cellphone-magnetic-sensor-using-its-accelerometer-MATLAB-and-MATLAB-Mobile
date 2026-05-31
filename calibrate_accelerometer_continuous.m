function calib = calibrate_accelerometer_continuous(rawData, g)
% Continuous sphere (norm-based) calibration

A = rawData.acc;

% --- Bias estimation ---
bias = mean(A,1)';

% Remove bias
A0 = A - bias';

% --- Scale estimation ---
scale = g / mean(vecnorm(A0,2,2));

calib.bias  = bias;
calib.scale = scale * eye(3);

% --- Sanity check ---
Acal = (calib.scale * A0')';
fprintf('Mean calibrated norm: %.3f m/s^2\n', mean(vecnorm(Acal,2,2)));
fprintf('Std calibrated norm : %.3f m/s^2\n', std(vecnorm(Acal,2,2)));

end
