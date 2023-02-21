clc;clear all;close all;
fp=800;
fs=1000;
fc=4000;
ripple=0.5;
attenuation=40;
wp=fp*2*pi/fc;
ws=fs*2*pi/fc;
tr_width=ws-wp;
N0=ceil(2*pi/tr_width);
N1=ceil(2*2*pi/tr_width);
N2=ceil(3*2*pi/tr_width);
F0=[0:1/N0:1];
A=[ones(1,10),zeros(1,N0-9)]
h=fir2(N0,F0,A);
freqz(h);
figure(2);stem(h,'.');

