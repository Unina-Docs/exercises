function y = myFarwardSubs(L, b)
  % MYFARWARDSUBS
  % Questo funzione implementa l'algoritmo di foreward substitution per
  % la risoluzione di sistemi lineari con matrici triangolari inferiori
  %
  % INPUT
  %   L : Una matrice triangolare inferiore 
  %   b : Il vettore dei termini noti
  % OUTPUT
  %   x : Il vettore delle soluzioni
  % COMPLESSITA O(n^2)
  
  n = length(b);
  y = zeros(n, 1);
  check = size(L);
  
  % Controllo che la dimensione della matrice sia coerente con la
  % dimensione di b
  if check(1) ~= check(2) || check(1) ~= n
      disp('Errore dimensione del sistema')
      return
  end
  
  y(1) = b(1) / L(1, 1);
  for k=2 : n
      y(k) = b(k);
      for j=1 : k-1
          y(k) = y(k) - L(k, j) * y(j);
      end
      
      %y(k) = y(k) / L(k, k); % Eliminare per una funz. più generale
  end
end

% Esempio di utilizzo
% A = [1 0 0; 2 3 0; 4 5 6];
% b = [1; 2; 3];
% x = myFarwardSubs(A, b)
