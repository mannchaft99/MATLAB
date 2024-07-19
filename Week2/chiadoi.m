function [nghiem, solanlap] = chiadoi(f,a,b,saiso)
e = b - a;
solanlap = 0;
while e >= saiso
    solanlap = solanlap +1;
    c = (a+b)/2;
    if f(c)*f(a) < 0
        b = c;
    else a = c;
    e = abs(b-a);
    end
    nghiem = a;
end
end

