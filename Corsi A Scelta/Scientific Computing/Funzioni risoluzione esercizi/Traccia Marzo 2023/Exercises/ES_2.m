% array di input
x = [-1 -0.5 0 0.5];
f = [0.86199480 0.95802009 1.0986123 1.2943767];

% vattore 'z' appoggio per la costruzione della spline [-1, 0.5]
z = linspace(-1,0.5);

% costituisco i valori per l'asse delle y
j = mySpline(x,f,z);

% funzione da traccia
f_1 = @(x)log(exp(x) + 2);

% derivata della funzione da traccia
f_2 = @(x)1 - 2./(2 + exp(x));

f_3 = f_2(x);

j_1 = mySpline(x,f_3,z);

% faccio il plotting dei punti assieme alla spline
plot(x, f, 'o', z, j);


% apporssimazione di f'(0.25) con errore 10^-11
for i =1:length(j_1)
    if f_2(0.25)- j_1(i) < 10^-11
        disp(i)
    end
end

disp(' ')

% approssimazione di f(0.25) con errore 10^-11
for i =1:length(j)
    if f_1(0.25)- j(i) < 10^-11
        disp(i)
    end
end


