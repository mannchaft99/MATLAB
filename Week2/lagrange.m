function px=lagrange(X,Y)
syms x;
n=length(X);
for i=1:n;
    a=1;
    for j=1:n
        if j~=i
            a=a*(x-X(j))/(X(i)-X(j));
        end
    end
    l(i)=a;
end
px=simplify(sum(l.*Y));
end