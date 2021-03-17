clear all

% Frequency Axis
f = linspace(-5000,5000);
% Frequency Response
h_f = (1./(((.002i*pi*f) + 1)));
% Magnitude and Phase
mag_h_f = abs(h_f);
phase_h_f = angle(h_f);
% Plot |H(f)|
figure(1)
plot(f,mag_h_f)