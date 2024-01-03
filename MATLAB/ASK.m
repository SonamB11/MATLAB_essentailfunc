clc
clear all
close all

f1=10;
A=1;
u = randi([0,1],1,10);
n = length(u);
t=0:0.01:n;
x = 1:1:(n+1)*100;
xtw=A.*sin(2*pi*f1*t) +(A/2);
for i = 1:n
for j = i:.1:i+1
bw(x(i*100:(i+1)*100)) = u(i);
end
end
bw = bw(100:end);
v=xtw.*bw;
subplot(3,1,1);
plot(t,xtw);
title("carrier");
grid on;
subplot(3,1,2);
plot(t,bw);
title("square pulses");
grid on;
subplot(3,1,3);
plot(t,v);
title("ASK Signal");
grid on;
