% matrice in input
A = [3 12 0 -1 0 0
     4 0 31 1 0 0
     2 1 0 0 17 -3
     27 2 0 0 0 1 
     0 0 0 -1 1 11
     0 0 0 24 -1 0];

% trasformazione della matrice
A = sparse(A);

% vettore dei termini noti
b = [38 117 12 98 14 55];

% risoluzione con metodi di BackSub e FarwardSub
[x_1] = SolveLinearSystem(A,b);

% risoluzione metodi Jacobi e Gauss-Seidel
[xv,iter] = myJacobi(A,b',zeros(8,1),400,1e-4);
[xv_1,iter_1] = myGS(A,b',zeros(8,1), 100,1e-4);

% Jacobi
disp(xv);
disp(iter);

% GS
disp(xv_1);
disp(iter_1);

% solver
disp(x_1);