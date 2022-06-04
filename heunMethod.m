% Precondition: f is a function handle with an anonymous function
function [solns] = heun_method(f, t_0, x_0, step_size, num_steps)
% Takes in first order ODE in form dx/dt = f(t,x)
% Takes in initial condition t_0 and x_0
% Takes in step size, and num of steps to approx values of the soln

% 1st column (t), 2nd column (x)
% num_steps + 1 bc of the 0th iteration (initial condition)
solns = zeros(num_steps + 1, 2);

solns(1,1) = t_0;
solns(1,2) = x_0;

t_old = t_0;
x_old = x_0;

for i = 1:num_steps
    % Set new t value
    t_new = t_old + step_size;

    % Two stages
    k1 = step_size * f(t_old, x_old);
    k2 = step_size * f(t_new, x_old + k1);

    % Set new x value
    x_new = x_old + (k1 + k2) / 2;

    % Add new values to solns matrix
    solns(i+1,1) = t_new;
    solns(i+1,2) = x_new;

    t_old = t_new;
    x_old = x_new;
end

end
