% funzione per la quale 5^(2/3) e' zero della funzione
f = @(x)x.^3 - 25;

% Valore di tolleranza
toll = 10^-4;

% valore teorico del numero di iterazioni necessarie
it_teorico = log2((5-0)/toll) - 1;

% approssimazione per eccesso
ceil(it_teorico)

% scelta dell'intervallo per l'algoritmo [0-5]
[x,it_vero] = myBisezione(f,0,5,toll);

% array conteneti i valori durante i passi di bisezione
disp(x);

% valore vero del numero di iterazioni necessarie per soddisfare
% la tolleranza
disp(it_vero);