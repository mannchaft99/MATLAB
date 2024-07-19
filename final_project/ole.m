function [x, y] = ole(app)
app.fxy = matlabFunction(app.fxy);
h = (app.xn - app.x0)/app.N;
x = app.x0:h:app.xn;
y = zeros(1,length(x));
y(1) = app.y0;
for i=1:length(x)-1
y(i+1) =  y(i) + h*app.fxy(x(i),y(i));
end
plot(app.Axe,x,y);
app.Axe.Title.String = 'Vẽ đồ thị bằng phương pháp Ơ - le';
end


