function [I,errest,x] = myTrapc(func,a,b,tol,varargin)
% MYTRAPC Metodo dei trapezi composto
% [I,errest,x] = myTrapc(func,a,b,tol) calcola l'integrale di func
% nell'intervallo [a,b] con tolleranza tol, utilizzando il metodo dei
% trapezi composto.
%
% Prende in input:
% func: funzione da integrare
% a: estremo sinistro dell'intervallo
% b: estremo destro dell'intervallo
% tol: tolleranza richiesta
% Fornisce in output:
% I: valore dell'integrale
% errest: errore commesso
% x: vettore dei nodi di quadratura

if (nargin == 4)
n = 3; else
  n = varargin{1};
end
h = (b-a)/(n-1);
x = linspace(a,b,n)';
weight = h/2*[1,2*ones(1,length(x)-2),1];
Iold = weight*feval(func,x);
x = linspace(a,b,2*n-1)';
weight = h*ones(1,n-1);
Inew = weight*feval(func,x(2:2:end-1));
I = (Inew+Iold)/2;
errest = abs(I-Iold)/2;
if (errest > tol)
  [I,errest,x] = myTrapc(func,a,b,tol,2*n-1);
end

%Esempio di utilizzo
%[I,errest,x] = myTrapc(@sin,0,pi/2,1e-6,1000)
