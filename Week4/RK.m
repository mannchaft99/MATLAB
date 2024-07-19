function [x, y] = RK(fxy,x0,xn,y0,N)
h = (xn - x0)/N;
x=x0:h:xn;
y = zeros(1,length(x));
y(1) = y0;
for i=1:length(x)-1
    k1 = h * fxy(x(i),y(i));
    k2 = h * fxy(x(i) + 0.5*h, y(i) + 0.5*k1);
    k3 = h * fxy(x(i) + 0.5*h, y(i) + 0.5*k2);
    k4 = h * fxy(x(i) + h, y(i) + k3);
    y(i+1) = y(i) + 1/6*(k1 + 2*k2 + 2*k3 + k4);
end
end

