
function x=GaussNaive(A,b)
A=[A b];
[m,n]=size(A);
for i=1:m-1
    for j=i+1:m
        c=A(j,i)/A(i,i);
        for k=i:n
            A(j,k)=A(j,k)-c*A(i,k);
        end
    end
end
for i=m:-1:1
    sum=A(i,n);
    for j=i+1:m
        sum=sum-x(j)*A(i,j);
    end
    x(i)=sum/A(i,i);
end
x=[x' 1];
end