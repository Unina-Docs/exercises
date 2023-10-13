% matrice in input
A = [0 2 1 4 1 3
     1 2 -1 3 4 0
     0 1 1 -1 2 -1
     2 3 -4 2 0 5
     1 1 1 3 0 2
     -1 -1 2 -1 2 0];

% eseguo il 
[L, U, P] = myLU(A);

% determinante calcolato a partire da U e L
disp(det(L)*det(U));

% determinante calcolato con la funzione classica di matlab
disp(det(A));