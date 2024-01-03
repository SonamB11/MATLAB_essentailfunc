clc;
clear all;

Nx = input('Enter the length of the first sequence x[n]: ');
x_shift = input('Enter the shift in origin for the first sequence x[n]: ');
x = zeros(1, Nx);
for n = 1:Nx
    x(n) = input(['Enter the value of %d: '],n);
end

Nh = input('Enter the length of the second sequence h[n]: ');
h = zeros(1,Nx);
for n = 1:Nh
    h(n) = input(['Enter the value of %d: '],n);
end

conv_result = conv(x, h);

n_conv = 0:length(conv_result)-1;

figure;

subplot(3, 1, 1);
stem(0:Nx-1, x);
xlabel('n');
ylabel('x[n]');
title('First Sequence');

subplot(3, 1, 2);
stem(0:Nh-1, h);
xlabel('n');
ylabel('h[n]');
title('Second Sequence');

subplot(3, 1, 3);
stem(n_conv, conv_result);
xlabel('n');
ylabel('y[n]');
title('Convolution');
