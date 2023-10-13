function [x, ierr, it] = myFixedPoint(g, x0, tol, kmax)
% MYFIXEDPOINT
% Il programma costruisce un metodo per il calcolo di una radice di una
% funzione.
%
%
% INPUT
%   'x'      = valore della radice calcolata dal programma
%   'ierr'   = flag per verificare se i termini di tolleranza sono stati
%              rispettati
%   'it'     = numero di iterazioni effettuate
%
% OUTPUT
%   'g'      = funzione in input
%   'x0'     = approssimazione iniziale
%   'kmax'   = numero massimo di iterazioni da effettuare
%   'tol'    = tolleranza

ierr = -1;
diff = 1 + tol;
k = 1;
while k < kmax && tol < diff
    x1 = g(x0);
    diff = abs(x1-x0);
    %disp(sqrt(2)-x0);
    x0 = x1;
end
it = k;
x = x1;
if tol > diff
    ierr = 0;
end

% Esempio
% g = @(x) sqrt(2+x);
% [x, ierr, it] = myFixedPoint(g, 0, 1e-6, 1000);
% disp(x);
% disp(ierr);
% disp(it);