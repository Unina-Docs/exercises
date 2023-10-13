function [x, it] = myBisection(f, a, b, tol)
% MYBISECTION  
% The program builds a method to compute the root of a function. It builds
% an intervall evaluating the funciton at the range boundarys, it computes
% the midpoint and it decides to move to the left or to the right to reduce
% the interval and checking its size compared to the tolerance.
%
% INPUT
%   'x'   = value of the root of the function
%   'it'  = number of iteration made
%
% OUTPUT
%   'f'   = input function
%   'a'   = inferior bound of the range
%   'b'   = upper bound of the range
%   'tol' = tollerance

x(1) = a; x(2) = b;
fa = f(a); fb = f(b); % evaluate the function at the boundarys
if fa * fb >= 0
    disp('Interval not acceptable');
    return;
end

it = ceil((log(b-a) - log(tol)) / log(2)); % mathematically comput the max
% number of iteration

for k=3:it+2
    x(k) = (a + b)/2;
    fxk = f(x(k));
    if fa * fxk == 0 % if fa * fxk  == 0 i've found the root
        break
    elseif fa * fxk < 0 % if fa * fxk < 0 I move the interval to the right
        b = x(k);
        fb = fxk;
    else
        a = x(k);   % if fb * fxk < 0 I move the interval to the left
        fa = fxk;
    end
end

% Esempio
% f = @(x) x^3 - 2*x - 5;
% [x, it] = myBisection(f, 1, 2, 1e-6);