clear; clc;
f = @(x) x.^3.*sin(x);
a = 0;
b = 1;
N_1 = 1;
N_10 = 10;
N_50 = 50;
format long

dx_integral = integral(f,a,b);

dx_hinhthang_N1 = tichphanhinhthang(f,a,b,N_1);
diff_hinhthang_N1  = abs(dx_integral - dx_hinhthang_N1);
dx_hinhthang_N10 = tichphanhinhthang(f,a,b,N_10);
diff_hinhthang_N10 = abs(dx_integral - dx_hinhthang_N10);
dx_hinhthang_N50 = tichphanhinhthang(f,a,b,N_50);
diff_hinhthang_N50 = abs(dx_integral - dx_hinhthang_N50);

dx_simpson_N1 = tichphanSimpson(f,a,b,N_1);
diff_simpson_N1  = abs(dx_integral - dx_simpson_N1);
dx_simpson_N10 = tichphanSimpson(f,a,b,N_10);
diff_simpson_N10 = abs(dx_integral - dx_simpson_N10);
dx_simpson_N50 = tichphanSimpson(f,a,b,N_50);
diff_simpson_N50 = abs(dx_integral - dx_simpson_N50);
