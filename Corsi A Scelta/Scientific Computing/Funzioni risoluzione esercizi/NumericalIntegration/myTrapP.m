function  [Tn] = myTrapP(f,a,b,n)
%   MYTRAP valutazione numerica di integrali utilizzando la formula composita dei trapezi
%   [Tn] = myTra(f,a,b,n) calcola l'integrale della funzione f in [a,b] con la formula dei trapezi
%   su n nodi.
%   f e' una stringa contenente la definizione della funzione.

    h=(b-a)/(n-1);
    x=a:h:b;
    % per certi valori di n, h non fa arrivare a b
    if max(size(x))~=n;x(n)=b;end
    %
    %
    y=double(subs(f,x));
    if length(y)<length(x) %caso in cui la funzione integranda e' una costante.
        y=y*ones(size(x));
    end
    t=2*sum(y(2:n-1));
    t=.5*h*(t+y(1)+y(n));

%   Esempio
%         syms x
%         f=x^2*exp(sin(x))
%         t=trap(f,-6,-2,50)
%      calcola l'integrale di f in [-6,-2] utilizzando la formula composita dei trapezi su 50
%      nodi
%
%   Esempio
%         t=trap('exp(-t^2)',-0.5,0.5,21)
%      calcola l'integrale di f in [-0.5,0.5] utilizzando la formula composita dei trapezi su 21
%      nodi