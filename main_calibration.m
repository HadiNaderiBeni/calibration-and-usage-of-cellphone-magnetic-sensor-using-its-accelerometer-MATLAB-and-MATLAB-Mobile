clc; clear; close all;

g  = 9.81;
fs = 100;

fprintf('=== STARTING SPHERE CALIBRATION ===\n');

rawData = acquire_data_offline("data/accelLog.mat", fs);

calib = calibrate_accelerometer_continuous(rawData, g);

fprintf('=== CALIBRATION COMPLETED ===\n');
disp(calib);

snake_game_offline(rawData, calib);
