X = [-20:0.1:20]
Y = [-20:0.1:20]
syms x y;
z = 'x.^3+2*y.^2-3';
z = str2func(['@(x, y)' z]);
[x,y]=meshgrid(X,Y);
t = z(x,y);
%mesh(x,y,t);
[fileName,pathName] = uigetfile('D:\MATLAB\Thực hành\Week5\data.csv','Open data');
data = readmatrix([pathName fileName]);
data1 = string(data(:,1));
data2 = strjoin(data1,'\t\t');