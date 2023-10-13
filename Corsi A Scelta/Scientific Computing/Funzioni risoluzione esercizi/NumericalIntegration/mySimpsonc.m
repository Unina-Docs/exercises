function [I,errest,x] = mySimpsonc(func,a,b,tol,varargin)
% MYSIMPSONC Calcola l'integrale di una funzione con il metodo di Simpson
% composto
% [I,errest,x] = mySimpsonc(func,a,b,tol,n)
% Input:
% func = funzione integranda
% a,b = estremi di integrazione
% tol = tolleranza richiesta
% Output:
% I = valore dell'integrale
% errest = stima dell'errore
% x = vettore dei nodi di quadratura
if (nargin == 4)
    n = 3;
else
    n = varargin{1};
end
h = (b-a)/(n-1);
x = linspace(a,b,n)';
weight = h/2*[1,2*ones(1,length(x)-2),1];
Iold = weight*feval(func,x);
x = linspace(a,b,2.*n-1)';
weight = h*ones(1,n-1);
Inew = weight*feval(func,x(2:2:end-1));
I = (Inew+Iold)/2;
errest = abs(I-Iold)/2;
if (errest > tol)
    warning("Tolleranza non raggiunta");
%   [Il,errestl,xl] = mySimpsonc(func,a,a+(b-a)/2,tol/2,n);
%   [Ir,errestr,xr] = mySimpsonc(func,a+(b-a)/2,b,tol/2,n);
%   I = Il+Ir;
%   errest = errestl+errestr;
%   x = union(xl,xr);
end

% Esempio di utilizzo
% [I,errest,x] = mySimpsonc(@(x) x.^2,0,1,1e-6,3)
