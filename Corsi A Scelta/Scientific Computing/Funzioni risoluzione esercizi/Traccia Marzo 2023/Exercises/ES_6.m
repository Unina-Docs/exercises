% Vettori di x e y su cui eseguire i minimi quadrati
x = [70 75 77 80 82 84 87 90]; % [70 - 90]
y = [2.10 2.12 2.15 2.20 2.22 2.23 2.26 2.30];% [2.10 - 2.30]

% plotto i dati ed estrapolo i coefficienti della retta
plot(x, y, 'o');
hold on

% coefficienti della retta
x_dat = myls(x, y, 2);

%retta
f = @(x)x_dat(2).*x +x_dat(1);

%plotting della retta
fplot(f, [70 90]);

% dati modificati in cui aggiungo 95 kg
% x_1 = [70 75 77 80 82 84 87 90 95];% [70 - 95]
%y_1 = [2.10 2.12 2.15 2.20 2.22 2.23 2.26 2.30 2.35];% [2.10 - 2.35]

% plot(x_1, y_1, 'o');
% hold on

% plotto i nuovi dati e verifico la buona rappresentazione 
% x_dat = myls(x_1, y_1, 2);
% f = @(x)x_dat(2).*x +x_dat(1);

% plotting della nuova retta
% fplot(f, [70 95]);