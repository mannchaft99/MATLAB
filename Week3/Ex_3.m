clear; 
clc;
f = @(x) 1./(1+x);
a = 0;
b = 1;
N = 10;
ketqua = double(tichphanSimpson(f,a,b,N))