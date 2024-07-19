clc; clear; syms x;
X = [0.1 0.3 0.5 0.7 0.9];
Y = [0.1002 0.3047 0.5236 0.7754 1.1198];
f1 = (1.1198 - 0.7754) / 0.2;
px = lagrange (X,Y);
dpx(x) = diff(px);
f2 = double(dpx (0.7));
f3 = 1 / sqrt(1 - 0.7^2);