fxy = @(x,y) x-y;
y0 = 5;
x0 = 10;
xn = 15;
N = 100;
[x,y] = ole(fxy,x0,xn,y0,N);
plot(x,y)
