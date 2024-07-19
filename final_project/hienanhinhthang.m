function [x, y] = hienanhinhthang(app)
app.fxy = matlabFunction(app.fxy);
h = (app.xn - app.x0)/app.N;
x = app.x0:h:app.xn;
y = zeros(1,length(x));
y(1) = app.y0;
for i=1:length(x)-1
    data = y(i) + h*app.fxy(x(i),y(i));
    while(1)
            y(i+1) = y(i) + h/2 *(app.fxy(x(i),y(i))+app.fxy(x(i+1),data));
            if(abs(y(i+1) - data) <= app.saiso)
                break;
            end
            data = y(i+1);
    end
end
plot(app.Axe,x,y);
app.Axe.Title.String = 'Vẽ đồ thị bằng phương pháp hiện ẩn hình thang';
end


