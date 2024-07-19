a = -1;
b = 2;
syms x;
f(x) = 1+x-exp(-2*x);
saiso = 0.01;
[x,y] = daycung(f,a,b,saiso)
