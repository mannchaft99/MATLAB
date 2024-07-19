xdau=0;
xcuoi=5;
N=25;
y0=1;
fxy = inline('(1-x)*y');
[x,y]=test(fxy,xdau,xcuoi,y0,N);
plot(x,y);
hold on
y = exp(x-x.^2/2);
plot(x,y,'r');