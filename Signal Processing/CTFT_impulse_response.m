% Sampling Period and Frequency
T_s = 0.0001;
f_s = 1/T_s;

% Time Axis
t = 0:T_s:4;

% Function - Sine Wave
R = 1000;
C = .000001;
h_t = ((1/(R*C))*exp((-t)/(R*C)));

% Frequency Axis
f = (((0:length(t)-1)/(length(t)-1))-0.5)*f_s;

% FFT
h_f = (T_s)*fftshift(fft(h_t));

% Magnitude and Phase
mag_h_f = abs(h_f);
phase_h_f = angle(h_f);

% Plot h(t) and |H(f)|
figure(1)
plot(t,h_t)
figure(2)
plot(f,mag_h_f)