function [x, ierr, it] = myNewton(f, fp, x0, tol, kmax)

% MYNEWTON
% The program builds a method to compute the root of a function. With the
% input of a initial abscissa x_0 the function and its derivative gets
% evaluated in said point in order to get closer to the value of the root.
% The difference between the previous number and the one calculated with
% the inverse ration of the function in the current point with the
% derivative in the same point allows the program to get closer to the
% value of the root.
%
% OUTPUT
%   'x'      = value of the root
%   'ierr'   = flag to verify if te conditions of the tolerance are met
%   'it'     = number of iterations made
%
% OUTPUT
%   'f'      = input function
%   'fp'     = derivative of the input function
%   'kmax'   = maximum number of iteration until the program stops
%   'tol'    = tolerance

ierr = - 1; % the default value of the flag is -1
x = x0;
k = 0;
fx= feval(f, x); % function gets evaluated in the in the starting point
fpx= feval(fp, x); % derivative gets evaluated in the in the starting point
diff = tol + 1; % use a dummy value of the difference to start the while cycle
v_diff = [];
while  diff >= tol && k < kmax
    diff = - fx / fpx;
    x = x + diff;
    diff = abs(diff);
    v_diff = [v_diff; diff];
    fx = feval(f,x);
    fpx = feval(fp,x);
    k = k + 1;
end
if tol > diff % if the conditions of tolerance are met then the flag is
    ierr = 0;       % put to zero
end
it = k;
end

% Esempio
% f = @(x) x^3 - 2*x^2 - 5;
% fp = @(x) 3*x^2 - 4*x;
% [x, ierr, it] = myNewton(f, fp, 1, 1e-6, 1000);



