function [x, ierr, it] = mySecant(f, x0, x1, tol, kmax)
% MYSECANT
% Il programma costruisce un metodo per il calcolo di una radice di una
% funzione. La funzione verifica la convergenza della funzione ad un valore
% alpha quando non è possibile verificare la derivata della funzione. Tale
% derivata viene sostituita da un rapporto incrementale calcolato su valori
% di f gia noti che inserisce l'utente; inoltre la velocità di convergenza
% sarà inferirore a quella di Newton non essendoci appunto nessuna
% valutazione della derivata, in particolare la convergenza sarà
% superlineare
%
%
% INPUT
%   'x'      = valore della radice calcolata dal programma
%   'ierr'   = flag per verificare se i termini di tolleranza sono stati
%              rispettati
%   'it'     = numero di iterazioni effettuate
%
% OUTPUT
%   'f'      = funzione in input
%   'x0'     = primo punto da assegnare
%   'x1'     = secondo punto da assegnare
%   'kmax'   = numero massimo di iterazioni da effettuare
%   'tol'    = tolleranza

ierr = -1;

f0 = f(x0);
f1 = f(x1);

x = x1 - (f1*(x1 - x0)/(f1 -f0));
diff=abs(x-x1);
k = 1;x0=x1; f0=f1; f1=f(x); x1=x;

while k < kmax && tol<diff
    x = x1 - (f1*(x1 - x0)/(f1 -f0));diff = abs(x - x1);
    k = k + 1;x0=x1; f0=f1; f1=f(x); x1=x;
end

it = k;

if tol > diff
    ierr = 0;
end
% Esempio
% f = @(x) x^3 - 2*x^2 - 5;
% [x, ierr, it] = mySecant(f, 1, 2, 1e-6, 1000);
% disp(x);
% disp(ierr);
% disp(it);
