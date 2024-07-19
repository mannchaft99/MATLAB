clear; clc; syms x;
f(x) = x^3-6*x+2;
fd1(x) = (x^3+2)/6; %ham lap
a = 0; b = 1;
saiso = 10^-3;
format long
%phuong phap chia doi
[nghiem1, solanlap1] = chiadoi(f,a,b,saiso);
nghiem1 = double(nghiem1);
%phuong phap lap
[nghiem2, solanlap2] = lap(fd1,a,b,saiso);
nghiem2 = double(nghiem2);
%phuong phap tiep tuyen
[nghiem3, solanlap3] = tieptuyen(f,a,b,saiso);
nghiem3 = double(nghiem3);
%phuong phap day cung
[nghiem4, solanlap4] = daycung(f,a,b,saiso);
nghiem4 = double(nghiem4);