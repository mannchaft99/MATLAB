clear; clc; syms x;
f(x)= (2^x-3)/5;
a = -1;
b = 0;
saiso = 10^-3;
format long
[nghiem, sll] = lap(f,a,b,saiso)
double(nghiem)