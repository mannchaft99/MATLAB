function [y] = tichphanhinhthang(fx,a,b,N)
syms x;
h = (b - a)/N;
i=1:1:N-1;
y = h/2*(fx(a) + fx(b) + 2*sum(fx(a+i*h)));
end
