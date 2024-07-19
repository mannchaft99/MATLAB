fxy = @(x,y) (x-y);
y0 = 5;
x0 = 10;
xn = 15;
N = 20;
[x,y] = hienantrungdiem(fxy,x0,xn,y0,N);
plot(x,y)