function spval = mySpline(xdata, ydata, zval)

% MYSPLINE
% La funzione di spline cubica utilizza un successione di
% polinomi di grado tre per approssimare una serie di punti.
% 
% INPUT
%  xdata = array di nodi su cui collegare i polinomi
%  ydata = ordinate di interpolazione
%  zval = valori delle ascisse su cui costruire il polinomio 
%         interpolante
% OUTPUT
% spval = ordinate da combinare con l'array zval per la 
%         costruzione del polinomio interpolante
%
    n = length(xdata);
    h = zeros(n-1, 1);
    A = zeros(n, n);
    delta = zeros(n, 1);
    
    b = zeros(n, 1);
    d = zeros(n, 1);
    
    spval = zeros(length(zval), 1);
    
    % Distanze tra i nodi 
    for j=1 : n-1
        h(j) = xdata(j+1) - xdata(j);
    end
    
    % Matrice dei coefficienti
    A(1, 1) = 1; A(n, n) = 1;
    for i=2 : n-1
        A(i, i) = 2*(h(i-1) + h(i)); % Diagonali
        A(i, i-1) = h(i-1); 
        A(i, i+1) = h(i);
    end
    
    % Vettore delle soluzioni
    for i=2 : n-1
        delta(i) = (3/h(i))*(ydata(i+1) - ydata(i)) - (3/h(i-1))*(ydata(i) - ydata(i-1));
    end
  
    % Calcolo le incognite
    x = A\delta;
    
    % Ottengo i valori per i coefficienti
    for i=1 : n-1
        b(i) = (ydata(i+1) - ydata(i))/h(i) - (h(i)/3)*(x(i+1) + 2*x(i));
        d(i) = (x(i+1) - x(i))/(3*h(i));
    end
    
    % Calcolo la spline nei punti 
    for i=1 : length(zval)
        for j=1 : n-1
           if(zval(i) >= xdata(j) && zval(i) <= xdata(j+1))
               spval(i) = ydata(j) + b(j)*(zval(i) - xdata(j)) + x(j)*(zval(i) - xdata(j))^2 + d(j)*(zval(i) - xdata(j))^3;
           end
        end
    end
end
% ESEMPIO
% xdata = [0 1 2 3 4 5 6 7 8 9 10];
% ydata = [0 1 2 3 4 5 6 7 8 9 10];
% zval = 0:0.1:10;
% spval = mySpline(xdata, ydata, zval);
% plot(xdata, ydata, 'o', zval, spval, 'r-')
% grid on
