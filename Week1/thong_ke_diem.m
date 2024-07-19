function x = thong_ke_diem(diem,n)
[y,amount] = size (diem);
sum = 0;
for i=1:amount
    sum = sum + diem(1,i);
end
avr = sum/amount;
avr = round(avr,2);
mmax = max(diem);
mmin = min(diem);
x = [amount mmin mmax avr];
end
