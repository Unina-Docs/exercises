function [L,U,P]=myLU(A) 
    % MYLU 
    % Fattorizzazione LU con pivoting parziale
    % [L,U,P]=myLU(A)
    % Input:
    % A matrice quadrata
    % Output:
    % L matrice triangolare inferiore
    % U matrice triangolare superiore
    % P matrice di permutazione

[n,n]=size(A); % Controllo dimensioni matrice
L=eye(n); P=L; U=A; % assenziamento iniziale
for k=1:n % loop per inizializzare
    [pivot m]=max(abs(U(k:n,k))); % processo di pivoting
    m=m+k-1;
    if m~=k 
        % scambia righe m e k in U
        temp=U(k,:); % assegnazione di variabile temporanee
        U(k,:)=U(m,:);
        U(m,:)=temp; % ritorno il valore temporaneo
        % scambio righe m e k in P
        temp=P(k,:); % assegnazione di temp 
        P(k,:)=P(m,:);
        P(m,:)=temp; % ritorno del valore di temp
        if k >= 2 % controllo delle condizioni 
            temp=L(k,1:k-1);
            L(k,1:k-1)=L(m,1:k-1);
            L(m,1:k-1)=temp;
        end % fine
    end
    for j=k+1:n  % loop per output 
        L(j,k)=U(j,k)/U(k,k);
        U(j,:)=U(j,:)-L(j,k)*U(k,:);
    end
end
% ESEMPIO
% A=[1 2 3; 4 5 6; 7 8 10];
% [L,U,P]=myLU(A)
% L =
%     1.0000         0         0
%     0.5714    1.0000         0
%    -0.4286    0.5000    1.0000
% U =
%     7.0000    8.0000   10.0000
%          0   -1.0000   -2.0000
%          0         0    0.5000
% P =
%     0     1     0
%     1     0     0
%     0     0     1
