function [xv,iter]=myGS(A,b,x0,nmax,toll)
%   MYGS
%   Calcola la soluzione del sistema lineare Ax=b utilizzando il metodo iterativo di
%   Gauss-Seidel.
%   [xv,iter]=myGS(A,b,x0,nmax,toll) calcola la soluzione del sistema lineare Ax=b con tolleranza
%   toll partendo dal vettore x0 e con un numero di iterazioni inferiore o uguale a nmax.
%   La funzione restituisce il vettore xv, approssimazione della soluzione ed il numero di iterazioni
%   effettuate.

[m,n] = size(A);
if (m ~= n)
    error('La matrice deve essere quadrata.');
end
if (size(b,2) ~= 1)||(size(x0,2) ~= 1) %controlla che b e x0 siano vettori colonna
    error('Il termine noto e il vettore iniziale devono essere vettori colonna.');
end
iter=0;
err=1;
xk=x0;
xk1=zeros(size(xk));
while err>toll
    if (iter == nmax)
        error('Attenzione il metodo non converge o nmax è piccolo per la tolleranza richiesta')
    end
    iter=iter+1;
    for i=1:n
        xk1(i)=(b(i)-A(i,1:i-1)*xk1(1:i-1)-A(i,i+1:n)*xk(i+1:n))/A(i,i);
    end
    err=norm(xk1-xk);
    xk=xk1;
end
iter=iter-1;
xv=xk1;

%   Esempio
%         A=diag(ones(8,1)*8)+diag(ones(7,1)*2,1)+diag(ones(7,1),-1);
%         b=[10,11,11,11,11,11,11,9]';
%         [xv,iter]=myGS(A,b,zeros(8,1),30,1e-12)
%      calcola la soluzione del sistema lineare Ax=b con tolleranza 1e-12 partendo dal vettore colonna 
%      di componenti nulle utilizzando il metodo iterativo di Gauss-Seidel.