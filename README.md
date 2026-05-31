# Smartphone Magnetic Sensor Calibration using MATLAB and MATLAB Mobile

This repository contains a MATLAB-based project for collecting and calibrating magnetic sensor data from a smartphone using MATLAB Mobile. The project uses the phone's built-in magnetometer and accelerometer to study magnetic field measurements, sensor bias, and calibration methods.

The main objective is to improve the quality of magnetic field measurements by identifying and compensating for sensor errors such as offset, distortion, and tilt effects.

---

## Project Overview

Modern smartphones contain several built-in sensors, including:

- Magnetometer
- Accelerometer
- Gyroscope
- GPS
- Barometer, depending on the device

In this project, the smartphone magnetometer is used to measure the local magnetic field. However, raw magnetometer data is usually affected by different types of errors, such as sensor bias, nearby metallic objects, and magnetic disturbances.

To improve the measurement quality, the magnetometer data is collected using MATLAB Mobile and processed in MATLAB.

The accelerometer is also used to estimate the orientation of the phone with respect to gravity. This can help analyze the tilt of the phone and improve the interpretation of the magnetic field measurements.

---

## Main Goal

The goal of this project is to calibrate the magnetic sensor inside a cellphone by:

1. Collecting raw magnetometer data from MATLAB Mobile
2. Collecting accelerometer data from the phone
3. Visualizing the raw magnetic field measurements
4. Identifying sensor bias and distortion
5. Correcting the magnetometer data using calibration methods
6. Comparing raw and calibrated magnetic field measurements

---

## Sensor Measurements

The magnetometer measures the magnetic field along three axes:

```text
m = [Bx, By, Bz]
