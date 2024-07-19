fxy = @(x,y) (1 - x).*y;
h = (xn - x0)/N;
y0 = 1;
x0 = 5;
xn = 10;
N = 3;
[a, b] = RK(fxy,x0,xn,y0,N);
plot(a,b)
