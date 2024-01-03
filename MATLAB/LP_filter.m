% Design A LP FIR filter
fp = 200;
fq = 300;
fs = 1000;
n = 20;
M = n + 1;
Wc = 2 * fp / fs;

load chirp;

b = fir1(n, Wc, 'low', rectwin(M));
[h_b, w_b] = freqz(b, 1);
subplot(5,2,1);
plot(w_b, abs(h_b))
title('Magnitude Response (Rectangular Window)')
subplot(5,2,2);
plot(w_b, angle(h_b))
title('Phase Response (Rectangular Window)')

c = fir1(n, Wc, 'low', blackman(M));
[h_c, w_c] = freqz(c, 1);
subplot(5,2,3);
plot(w_c, abs(h_c))
title('Magnitude Response (Blackman Window)')
subplot(5,2,4);
plot(w_c, angle(h_c))
title('Phase Response (Blackman Window)')

d = fir1(n, Wc, 'low', hamming(M));
[h_d, w_d] = freqz(d, 1);
subplot(5,2,5);
plot(w_d, abs(h_d))
title('Magnitude Response (Hamming Window)')
subplot(5,2,6);
plot(w_d, angle(h_d))
title('Phase Response (Hamming Window)')

e = fir1(n, Wc, 'low', bartlett(M));
[h_e, w_e] = freqz(e, 1);
subplot(5,2,7);
plot(w_e, abs(h_e))
title('Magnitude Response (Bartlett Window)')
subplot(5,2,8);
plot(w_e, angle(h_e))
title('Phase Response (Bartlett Window)')

f = fir1(n, Wc, 'low', kaiser(M));
[h_f, w_f] = freqz(f, 1);
subplot(5,2,9);
plot(w_f, abs(h_f))
title('Magnitude Response (Kaiser Window)')
subplot(5,2,10);
plot(w_f, angle(h_f))
title('Phase Response (Kaiser Window)')
