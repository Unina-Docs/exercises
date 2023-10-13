function coeff = myls(xdata, ydata, m)
% MYLS
% coeff = myls(xdata, ydata, m)
% E' una funzione che prende in INPUT due vettori di dimensione n
% ed il numero di coefficienti che vogliamo in output
% Restituisce in OUTPUT m coefficienti di un polinomio 
%
% Questa funzione usa il metodo dei minimi quadrati per trovare dei
% coefficienti di un polinomio che approssima i nodi
%
% Nello specifico, viene costruita una matrice dei coefficienti B che
% contiene le potenze dei nodi x da x^0 a x^m. Viene costruito un
% vettore di termini noti b che contiene la somma degli y_i
% moltiplicati per le potenze di x_i. Viene risolto questo sistema, ed
% il risultato è proprio il vettore dei coefficienti del polinomio.
% 
% xdata : vettore riga : sono le ascisse dei punti dati
% ydata : vettore riga : sono le ordinate dei punti dati
% m : intero : è il numero di coefficienti del polinomio
% Questa funzione restituisce in ordine i coefficienti a_0, ..., a_m;
% Non c'è alcun controllo sull'input;
    
    if length(xdata) ~= length(ydata)
        disp('La dimensione dei dati deve essere uguale!')
        return
    end
    
    m = m-1;
    n = length(xdata) - 1;
    B = ones(n+1, m+1);
    b = zeros(n+1, 1);
    A = zeros(m+1, m+1);
    
    for i=2 : m+1
        B(:, i) = (xdata').^(i-1);
    end

    A = B'* B;
    b = B' * ydata';
    coeff = (A\b)';
end

% Esempio di utilizzo
% xdata = [0 1 2 3 4 5 6 7 8 9 10];
% ydata = [0 1 2 3 4 5 6 7 8 9 10];
% m = 3;
% coeff = myls(xdata, ydata, m)
