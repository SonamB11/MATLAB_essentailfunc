clc
clear vars

Fs = 10000; 
fm = 100;
t = 0:1/Fs:0.1; 

fm = 100;
Am = 1;  
message_signal = Am * cos(2*pi*fm*t);
message_signal_phaseshifted = Am * sin(2*pi*fm*t);

fc = 1000; 
Ac = 1;  
carrier_signal = Ac * cos(2*pi*fc*t);
carrier_signal_phaseshifted = Ac * sin(2*pi*fc*t);

% modulated_signal = message_signal .* carrier_signal;
dsb = message_signal .* carrier_signal;
dsb2 = message_signal_phaseshifted .* carrier_signal_phaseshifted;

upper_sideband=dsb-dsb2;
lower_sideband=dsb+dsb2;
ssb_sc_signal = upper_sideband - lower_sideband;

N = length(upper_sideband);
frequency_spectrum = fftshift(fft(upper_sideband)) / N;
frequency_axis = linspace(-Fs/2, Fs/2, N);
D=lower_sideband.*carrier_signal;
n=length(ssb_sc_signal);

[b, a] = butter(2,fm/Fs); 
s_recovered = filter(b, a, D);

subplot(6,1,1);
plot(t, message_signal);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(6,1,2);
plot(t, carrier_signal);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(6,1,3);
plot(t, upper_sideband);
title('Upper Sideband');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(6,1,4);
plot(t, lower_sideband);
title('Lower Sideband');
xlabel("Time")
ylabel('Amplitude');

subplot(6,1,5);
plot(t, s_recovered);
title('Recovered Mssage Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(6,1,6);
plot(abs(frequency_axis), abs(frequency_spectrum));
title('Frequency Spectrum of SSB-SC Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

sgtitle('SSB-SC Modulation');