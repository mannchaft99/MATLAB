function [nghiem,solanlap] = lap(f,a,b,saiso)
    xT=a;
    solanlap=0;
    e=saiso+1;
    while(e>saiso)
        nghiem=f(xT);
        e=abs(nghiem-xT);
        xT=nghiem;
        solanlap=solanlap+1;
    end 
end
