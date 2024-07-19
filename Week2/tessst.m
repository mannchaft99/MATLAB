clc; clear; syms x;
saiso = 10^-2;
f(x)=1-1/2*sin(x)-0.25;
b = 1;
a=0
xi = (f(a)*(b-a))/(f(b)-f(a));
double(xi)