function rawData = acquire_data_offline(filename, fs)

load(filename);   % must contain "Acceleration" timetable

rawData.acc  = Acceleration.Variables;
rawData.time = seconds(Acceleration.Timestamp - Acceleration.Timestamp(1));
rawData.fs   = fs;

end
