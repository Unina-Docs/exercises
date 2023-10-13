function x = myBackSubs(U, b)
  % MYBACSUBS
  %   Questa funzione implementa l'algoritmo di backward substitution per
  %       la risoluzione di sistemi triangolari superiori
  %     INPUT
  %       U : Una matrice triangolare superiore 
  %       b : Il vettore dei termini noti
  %     OUTPUT
  %       x : Il vettore delle soluzioni
  %     COMPLESSITA O(n^2)
  
  n = length(b);
  x = zeros(n, 1);
  check = size(U);
  
  % Controllo che la dimensione di U sia coerente con quella di b
  if check(1) ~= check(2) || check(1) ~= n
      disp('Errore dimensione della matrice')
      return
  end
  
  for k = n:-1:1
      j = k+1:n;
      x(k) = (x(k) - U(k,j)*x(j))/U(k,k);
  end
end

% Esempio
% A = [1 2 3; 0 4 5; 0 0 6];
% b = [1; 2; 3];
% x = myBackSubs(A, b)
