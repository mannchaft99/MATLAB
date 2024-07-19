function [x1,n]=daycung(fx,a,b,e)
if fx(a)*fx(b)>0
   disp('Fail khoang phan ly');
   return
end
es=abs(b-a);
n=0;
x0=b;
while es>=e
    n=n+1;
    x1=(a*fx(b)-b*fx(a))/(fx(b)-fx(a));
    if fx(x1)==0
        es=0;
        break;
    end
    if fx(x1)*fx(a)<0
        b=x1;
    else
        a=x1;
    end
    es=abs(x0-x1);
    x0=x1;
end