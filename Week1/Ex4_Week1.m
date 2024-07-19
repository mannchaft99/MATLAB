A = randi(100,5)
mmax = max(max(A))
fprintf("Giá trị lớn nhất là: %d \n",mmax);
for i=1:5
for j=1:5
if A(i,j) == mmax
fprintf("Tại vị trí cột %d, hàng %d\n",i,j)
end
end
end