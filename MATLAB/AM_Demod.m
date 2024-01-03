clc
clearvars
fm=3000; 
fc=100000;
fs=10*fc;
a=0.01/fc; 
t=0:a:0.0006;
t1=0:1/fs: fm/fs;
k1=0.5;

M=cos(2*pi*3000*t);  C=cos(2*pi*fc*t);
S1=(1+k1*M).*C;
D = S1 .* C;
[b, a] = butter(6,fm/fs); 
s_recovered = filter(b, a, D);

subplot(5,1,1);
plot(t,M);
title('Message Signal')
xlabel("Time")
ylabel('Amplitude');

subplot(5,1,2);
plot(t, S1);
title('AM Signal');
xlabel("Time")
ylabel('Amplitude');

subplot(5,1,3);
plot(t, D);
title('Demodulated Signal (Envelope)');
xlabel("Time")
ylabel('Amplitude');

subplot(5,1,4);
plot(t, s_recovered);
title('Recovered Message Signal');
xlabel("Time")
ylabel('Amplitude');

M=cos(2*pi*3000*t1);  
C=cos(2*pi*fc*t1);
S2=(1+k1*M).*C;
n=length(S2);
am_spectrum = fft(S2,n);
frequencies = (0:n-1)*(fs/n);

subplot(5,1,5);
plot(frequencies, abs(am_spectrum));
title('Amplitude Spectrum');
xlabel("Time")
ylabel('Amplitude');