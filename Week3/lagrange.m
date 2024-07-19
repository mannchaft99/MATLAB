function [px] = lagrange(X,Y)
[a, m] = size (X);
[b, n] = size (Y);
syms x;
p0 = 1;
p1 = 1;
px = 0;
if m~=n 
    error('Nhap chieu dai X bang Y!');
    return 
end
for j=1:n
    p2 = 1;
    p3 = 1;
    for k = 1:n
        if j~= k
            t2 = (x - X(k));
            t3 = (X(j) - X(k));
        else 
            t2 = 1;
            t3 = 1;
        end
        p2 = p2*t2;
        p3 = p3*t3;
    end
    l(j) = p2/p3;
end
for z  = 1:n
    px = px + l(z)*Y(z);
end
px = simplify(px);
end
