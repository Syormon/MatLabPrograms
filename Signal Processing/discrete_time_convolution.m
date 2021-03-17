clear
clc

%MatLab step - boolean function + sampling
%N_s = 0.0001;
%n = 0:N_s:0.01;
%u = @(n)n >= 0;

% Input signal, x(n)
n1 = [0 1 2 3 4];
%n1 = [-2 -1 0 1 2 3 4];
%a = [0 0 0 1 2 3 0];
a = [0 1 1 1 0];
%a = u(n)-u(n-3);

%System Impulse Response, h(n)
n2 = [0 .333 .111 .037 .012];
b = [0 1 2 3 4];
%n2 = [-2 -1 0 1 2 3 4];
%b = [0 0 4 -2 1 -.5 0];
%b = ((.333)^n)*(u(n)-u(n-4));

%Output signal, c(n)
n = (0:(length(a)+ length(b)-2))+(min(n1)+min(n2));
c = conv(a,b);
%c = (1.5)*u(n)-(.5)*((.333)^n)*u(n)-(1.5)*u(n-3)+(.5)*((.333)^(n-3))*u(n-3);

%plotting
figure(1)
stem(n1,a)
title('x(n)')

figure(2)
stem(n2,b)
title('h(n)')

figure(3)
stem(n,c)
title('y(n)')