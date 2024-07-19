function [x, y] = test(fxy,xdau,xcuoi,y0,N)
h = (xcuoi-xdau)/N;
x = xdau:h:xcuoi;
y=zeros(1,length(x));
y(1)=y0;
for i=1:length(x)-1
    ytb = y(i)+(h/2)*fxy(x(i),y(i));
    y(i+1)=y(i)+h*fxy(x(i)+h/2,ytb);
end

