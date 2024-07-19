function [xM,n] = tieptuyen(f,a,b,saiso)
fx=inline(f);
if(fx(a)*fx(b)>0)
    disp('Khong co nghiem trong khoang nay');
else
    f1=diff(f);
    f2=diff(f1);
    fx1=inline(f1);
    fx2=inline(f2);
    for i=a:0.1:b
        if (fx(i)*fx2(i)>0)
            x0=i;
            break
        end
    end
    xT=x0;
    n=0;
    e=saiso+1;
    while(e>saiso)
        xM=xT-fx(xT)/fx1(xT);
        e=abs(xM-xT);
        xT=xM;
        n=n+1;
    end 
end
end
