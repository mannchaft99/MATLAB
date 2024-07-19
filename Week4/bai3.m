fxy = @(x,y) x-y;
y0 = 1;
x0 = 4;
xn = 5;
N = 10;
e = 0.001;
[a, b] = hienanhinhthang(fxy,x0,xn,y0,N,e);
plot(a,b)

