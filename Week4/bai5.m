fxy = @(x,y) (1 - x).*y;
y0 = 1;
x0 = 0;
xn = 5;
N = 25;
e = 0.001;
[x, y] = ole(fxy,x0,xn,y0,N);
plot(x,y,'m')
hold on
[x, y] = hienantrungdiem(fxy,x0,xn,y0,N);
plot(x,y,'y')
[x, y] = hienanhinhthang(fxy,x0,xn,y0,N,e);
plot(x,y,'g')
[x, y] = RK(fxy,x0,xn,y0,N);
plot(x,y,'b')
y = exp(x-x.^2/2);
plot(x,y,'k')
legend('Ole','hienantrungdiem','hienanhinhthang','RK','Nghiệm chính xác');