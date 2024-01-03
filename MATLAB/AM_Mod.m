clc
clearvars
am=1; 
ac=1;
fm=3000;
fc=100000;
k1=0.5; k2=1; k3=1.5;
a=0.01/fc;
t =0:a:0.0006;
M=am*cos(2*pi*fm*t);
C=ac*cos(2*pi*fc*t);
S1=(1+k1*M).*C; 
S2=(1+k2*M).*C;
S3=(1+k3*M).*C;
subplot(3,1,1);
plot(t,S1);
title('Amplitude Modulated Signal(UnderModulation)')
xlabel("Time")
ylabel('Magnitude');
subplot(3,1,2);
plot(t,S2);
title('Amplitude Modulated Signal')
xlabel("Time")
ylabel('Magnitude');
subplot(3,1,3);
plot(t,S3);
title('Amplitude Modulated Signal(OverModulation)')
xlabel("Time")
ylabel('Magnitude');
