clear;
clc;

b = [1,1,0,1,1,0,0,1,1,1];
m=[];
Vp=1;
for i=1:size(b,2)
 if b(i)==1
    m=[m ones(1,100)*Vp];
 elseif b(i)==0
    m=[m ones(1,100)*(-Vp)];
 end
end

n = length(b);
t = 0:.01:n;
x = 1:1:(n+1)*100;
temp_e = zeros(n);
temp_o = zeros(n);
for i =1:2:n
    temp_o(i) = b(i);
    temp_o(i+1) = b(i);
end
for i = 2:2:n
    temp_e(i) = b(i);
    temp_e(i+1) = b(i);
end
for i = 1:n
    if (temp_o(i) == 0)
        temp_o(i) = -1;
    else
        temp_o(i) = 1;
    end
    for j = i:.1:i+1
        b_o(x(i*100:(i+1)*100)) = temp_o(i);
    end
end
for i = 1:n
    if (temp_e(i) == 0)
        temp_e(i) = -1;
    else
        temp_e(i) = 1;
    end
    for j = i:.1:i+1
        b_e(x(i*100:(i+1)*100)) = temp_e(i);
    end
end
b_o = b_o(100:end);
b_e = b_e(100:end);

figure
subplot(3,1,1)
plot(m)

subplot(3,1,2)
plot(t,b_o)
subplot(3,1,3)
plot(t,b_e)

fc = 2;
s_wave=sin(2*pi*fc*t);
c_wave=cos(2*pi*fc*t);
figure
subplot(2,1,1)
plot(t,s_wave)
subplot(2,1,2)
plot(t,s_wave)
os = b_o.*s_wave;
es = b_e.*c_wave;

figure
subplot(3,1,1)
plot(t,os)
subplot(3,1,2)
plot(t,es)
sum = os+es;
subplot(3,1,3)
plot(t,sum)