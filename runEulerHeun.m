clear all; close all; clc;
% Solves differential equations using Euler's method and Heun's method, 
% where ODE's are in the form dx/dt = f(t,x)
% Reference: heun_method(f(t,x), t_0, x_0, step_size, num_steps)
% Reference: euler_method(f(x,y), x_0, y_0, step_size, num_steps)
% Euler's method and heun's method will only be accurate as long as 
% function does not change too rapidly

% dx/dt = t + x
f1 = @(t,x) t + x;

% Plot analytical vs numerical soln
figure

% Analytical solution
t_anal = linspace(0,10,100);
x_anal = exp(t_anal)-t_anal-1;

% Eulers method
euler_solns = euler_method(f1, 0, 0, 0.5, 20)
t_euler = euler_solns(:,1);
x_euler = euler_solns(:,2);

% Heuns method
heun_solns = heun_method(f1, 0, 0, 0.5, 20)
t_heun = heun_solns(:,1);
x_heun = heun_solns(:,2);

% Calculate error and plot on separate graph

% Plot
plot(t_anal,x_anal)
hold on
plot(t_euler,x_euler)
hold on
plot(t_heun,x_heun)
grid on
xlabel('time')
ylabel('x(t)')
xlim([-Inf Inf])
ylim([0 500])
legend('Analytical soln', 'Eulers method', 'Heuns method')
title('Solutions to ODE')
