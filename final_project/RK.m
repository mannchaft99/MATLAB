function [x, y] = RK(app)
app.fxy = matlabFunction(app.fxy);
h = (app.xn - app.x0)/app.N;
x=app.x0:h:app.xn;
y = zeros(1,length(x));
y(1) = app.y0;
for i=1:length(x)-1
    k1 = h * app.fxy(x(i),y(i));
    k2 = h * app.fxy(x(i) + 0.5*h, y(i) + 0.5*k1);
    k3 = h * app.fxy(x(i) + 0.5*h, y(i) + 0.5*k2);
    k4 = h * app.fxy(x(i) + h, y(i) + k3);
    y(i+1) = y(i) + 1/6*(k1 + 2*k2 + 2*k3 + k4);
end
plot(app.Axe,x,y);
app.Axe.Title.String = 'Vẽ đồ thị bằng phương pháp Runge - Kutta';
end

