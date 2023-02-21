clc;close all;clear all;
T=10^(-3);
fs=1/T;
wp=0.2*pi*fs;rp=1;ws=0.3*fs*pi;rs=10;

[N,omegac]=butterworthord(wp,ws,rp,rs)

[B,A]=butter(N,omegac,'s');
[num1,den1]=impinvar(B,A,fs);
freqz(num1,den1,'whole');

