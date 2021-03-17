% Number of Fourier Series Terms
N = 30;

% Fundamental Frequency and Period
T_0 = 2;
f_0 = 1/T_0;

% Frequency Axis
f = [0 (1:N)*f_0];

% a(n) and b(n)
n = 1:N;
a_0 = 0;
a_n = (4./(pi*n)).*sin(n*pi/2);
b_n = zeros(size(a_n));
a_n = [a_0 a_n];
b_n = [0 b_n];
c_n = sqrt(a_n.^2+b_n.^2);
theta_n = atan2(-b_n,a_n);

% Plot |Y(f)|=c_n and Phase of Y(f)=theta_n
figure(1)
plot(f,c_n)
figure(2)
plot(f,theta_n)

% Reconstruct Signal from Sinusoids
t_2 = linspace(0,2*T_0,1000);
y_t_2 = zeros(size(t_2));

for i = 1:length(c_n)
y_t_2 = y_t_2+(c_n(i)*cos(2*pi*f(i)*t_2+theta_n(i)));
end

figure(3)
plot(t_2,y_t_2)