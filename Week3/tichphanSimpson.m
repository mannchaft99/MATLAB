function [y] = tichphanSimpson(fx,a,b,N)
h = (b - a)/N;
i = 1:2:N-1;
j = 2:2:N-1;
y = h/3*(fx(a) + fx(b) + 4*sum(fx(a + i*h)) + 2*sum(fx(a + j*h)));
end
