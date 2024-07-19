t = 0:0.01:10
a_rad = (30*pi/180)
V= 0.5*sin(111*t+a_rad) + 0.3*cos(217*t)
I = 0.7*cos(173*t)+0.02
plot (t,V,'m--',t,I,'k-.')
title ('A lovely plot')
xlabel ('Time(s)')
ylabel ('Voltage (V) and Current (mA)')
legend ('V','I')
P = I.*V
hold on
plot(t,P,'b-','linewidth',3)
hold off
legend ('V','I','P')
for i=1:1001
    X = (i-1)/100;
    Y = P(:,i);
    if Y > 0.2
        text(X,Y,'x')
    end
end




