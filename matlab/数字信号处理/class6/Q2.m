clc;clear;close all;
Xk=[36.0000,-4.0000+9.6569i,-4.0000+4.0000i,-4.0000+1.6569i,-4.0000,-4.0000-1.6569i,-4.0000-4.0000i,-4.0000-9.6569i]
N=length(Xk);
Xk1=conj(Xk);
xn1=ditfft(Xk1);
xn=conj(xn1)/N;
xn1=real(xn)
xn2=fft(Xk1);
xn2=conj(xn2)/N;
xn2=abs(xn2)
xn3=ifft(Xk)
