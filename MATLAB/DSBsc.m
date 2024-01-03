clc
clear vars
Fs = 10000; 
fm = 100;
t = 0:1/Fs:0.1; 

fm = 100;
Am = 1;  
message_signal = Am * cos(2*pi*fm*t);

fc = 1000; 
Ac = 1;  
carrier_signal = Ac * cos(2*pi*fc*t);

modulated_signal = message_signal .* carrier_signal;

n=length(modulated_signal);
D = modulated_signal .* carrier_signal;
[b, a] = butter(2,fm/Fs); 
s_recovered = filter(b, a, D);
am_spectrum = fft(modulated_signal,n);
frequencies = (0:n-1)*(Fs/n);

subplot(5,1,1);
plot(t, message_signal);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5,1,2);
plot(t, carrier_signal);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5,1,3);
plot(t, modulated_signal);
title('DSB-SC Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5,1,4);
plot(t, s_recovered);
title('Recovered Message Signal');
xlabel("Time")
ylabel('Amplitude');

subplot(5,1,5);
plot(frequencies, abs(am_spectrum));
title('Amplitude Spectrum');
xlabel("Time")
ylabel('Amplitude');

sgtitle('DSB-SC Modulation');
