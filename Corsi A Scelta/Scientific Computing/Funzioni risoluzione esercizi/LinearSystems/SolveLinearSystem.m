function x = SolveLinearSystem(A, b)
% SOLVELINEARSYSTEM 
%   Risolve un sistema lineare Ax = b
%   Input:
%       A: matrice dei coefficienti
%       b: vettore dei termini noti
%   Output:
%       x: vettore soluzione del sistema lineare Ax = b


    n = length(b);
    x = zeros(n, 1);
    y = zeros(n, 1);
    % Decomposizione della matrice per mezzo del metodo Doolittle
    for i = 1:1:n
        for j = 1:1:(i - 1)
            alpha = A(i,j);
            for k = 1:1:(j - 1)
                alpha = alpha - A(i,k)*A(k,j);
            end
            A(i,j) = alpha/A(j,j);
        end
        for j = i:1:n
            alpha = A(i,j);
            for k = 1:1:(i - 1)
                alpha = alpha - A(i,k)*A(k,j);
            end
            A(i,j) = alpha;
        end
    end
    % A = L+U-I
    % calcolo delle soluzioni di Ly = b
    for i = 1:1:n
        alpha = 0;
        for k = 1:1:i
            alpha = alpha + A(i,k)*y(k);
        end
        y(i) = b(i) - alpha;
    end
    % calcolo delle soluzioni di Ux = y
    for i = n:(-1):1
        alpha = 0;
        for k = (i + 1):1:n
            alpha = alpha + A(i,k)*x(k);
        end
        x(i) = (y(i) - alpha)/A(i, i);
    end    
end

% Esempio 
% A = [1 2 3; 4 5 6; 7 8 10];
% b = [3; 3; 4];
% x = SolveLinearSystem(A, b)
