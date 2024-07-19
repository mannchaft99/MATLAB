clear; clc; syms x;
f(x) = x-1/2*sin(x)-0.25;
a = 0;
b = 1;
saiso = 10^-2;
[nghiem, sll, ss] = daycung(f,a,b,saiso);
double(nghiem)
double(ss)
b