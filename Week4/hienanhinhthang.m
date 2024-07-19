function [x, y, sll] = hienanhinhthang(fxy,x0,xn,y0,N,e)
h = (xn - x0)/N;
x = x0:h:xn;
y = zeros(1,length(x));
y(1) = y0;
sll = 0;
for i=1:length(x)-1
    data = y(i) + h*fxy(x(i),y(i));
    while(1)
        sll = sll + 1;
            y(i+1) = y(i) + h/2 *(fxy(x(i),y(i))+fxy(x(i+1),data));
            if(abs(y(i+1) - data) <= e)
                break;
            end
            data = y(i+1);
    end
end
end


