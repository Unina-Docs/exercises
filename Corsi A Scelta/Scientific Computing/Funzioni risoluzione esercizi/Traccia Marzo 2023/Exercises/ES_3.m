% estremi dell'intervallo
a = pi;
b = 0;

% funzione da integrare
fun = @(x) x.^2.*cos(x);

% tolleranza
tol = 10.^-4;

% metodo di integrazione dei Trapezi
[I_t, err_t, x_t] = myTrapc(fun,a,b,tol)

% metodo di integrazione di Simpson
[I_s, err_s, x_s] = mySimpsonc(fun,a,b,tol)

