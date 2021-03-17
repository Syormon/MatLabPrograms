% Number of Fourier Series Terms
N = 30;
u = @(t)t >= 0;

% Fundamental Frequency and Period
T_0 = 2;
f_0 = 1/T_0;

% Sampling Period and Frequency
f_s = (N)*(T_0/2);
T_s = 1/f_s;

% Time Axis
t = (0:2*N)*T_s;

% Signal Equation
y_t = u(t+0.5)-2*u(t-0.5)+2*u(t-1.5);

% Frequency Axis
f = (((0:length(t)-1)/(length(t)-1))-0.5)*f_s;

% FFT
y_f = (T_s)*fftshift(fft(y_t));

% Magnitude and Phase
mag_y_f = abs(y_f);
phase_y_f = angle(y_f);

% Plot |Y(f)| and Phase of Y(f)
figure(4)
plot(f,mag_y_f)
figure(5)
plot(f,phase_y_f)

% Reconstruct Signal from Sinusoids
t_2 = linspace(0,2*T_0,1000);
y_t_2 = zeros(size(t_2));

for i = 1:length(mag_y_f)/2
y_t_2 = y_t_2+(mag_y_f(i)*cos(2*pi*f(i)*t_2+phase_y_f(i)));
end

figure(6)
plot(t_2,y_t_2)