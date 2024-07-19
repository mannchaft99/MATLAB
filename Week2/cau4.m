clear; clc; syms x;
f(x) = x^4 - 3*x^2 + 75*x -1000;
a = -7; b = -6;
saiso = 10^-3;
format long
%phuong phap chia doi
[nghiem1, solanlap1] = chiadoi(f,a,b,saiso);
nghiem1 = double(nghiem1);
%phuong phap tiep tuyen
[nghiem3, solanlap3] = tieptuyen(f,a,b,saiso);
nghiem3 = double(nghiem3);
%phuong phap day cung
[nghiem4, solanlap4] = daycung(f,a,b,saiso);
nghiem4 = double(nghiem4);