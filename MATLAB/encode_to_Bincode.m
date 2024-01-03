clc
clear all;
close all;

t = 0:0.05:3;
A = 4;
F = 1;
m_t = A*sin(2*pi*F*t);
fs = 20;
Ts = 1 / fs;
n = 0:Ts:3;

impulse_train=ones(size(n));
sampled_signal=m_t.*impulse_train;

step_size = 1;
quantized_signal = zeros(1, length(n));
for i = 2:length(n)
    difference = sampled_signal(i)-sampled_signal(i-1);
    if difference > 0
        quantized_signal(i)=quantized_signal(i-1) + step_size;
    else
        quantized_signal(i) = quantized_signal(i-1) - step_size;
    end
end

encoded_signal = quantized_signal;

binary_code = zeros(size(encoded_signal));
for i = 2:length(encoded_signal)
    if encoded_signal(i) > encoded_signal(i-1)
        binary_code(i)=1;
    end
end

n=0:(length(t) - 1);
ts=n/fs;
n = 0:Ts:3;

subplot(4, 1, 1);
plot(t, m_t);
title('Original Signal (m(t))');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 1, 2);
stem(n, sampled_signal);
title('Sampled Signal');
xlabel('Discrete Time (n)');
ylabel('Amplitude');

subplot(4, 1, 3);
stairs(n, encoded_signal);
title('Encoded Signal');
xlabel('Discrete Time (n)');
ylabel('Amplitude');

subplot(4,1,4)
stem(ts, binary_code)
title('Binary Code')
