% Precondition: f is a function handle with an anonymous function
function [solns] = euler_method(f, x_0, y_0, step_size, num_steps)
% Takes in first order ODE in form dy/dx = f(x,y)
% Takes in initial condition x_0 and y_0
% Takes in step size, and num of steps approx values of the soln

% 1st column (x), 2nd column (y)
% num_steps + 1 bc of the 0th iteration (initial condition)
solns = zeros(num_steps + 1, 2);

solns(1,1) = x_0;
solns(1,2) = y_0;

x_old = x_0;
y_old = y_0;

for i = 1:num_steps
    % Derivative
    m = f(x_old,y_old);

    % Set new values
    y_new = y_old + step_size * m;
    x_new = x_old + step_size;

    solns(i+1,1) = x_new;
    solns(i+1,2) = y_new;

    x_old = x_new;
    y_old = y_new;
end

end
