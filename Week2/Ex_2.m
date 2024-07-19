function [nghiem, solanlap] = chiadoi(f,a,b,saiso)
e = abs(a-b);
while e <= saiso
    solanlap = solanlap +1;
    c = (a+b)/2;
    fc = subs(f,c);
    fa = subs(f,a);
    if fc*fa < 0
        b = c;
    else a = c;
    e = b-a;
    end
end
nghiem = e;
end
