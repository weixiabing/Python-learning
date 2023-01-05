%阻带最小衰减为40dB，选择汉宁窗
clc;clear all;close all;
%采用窗函数法设计带通滤波器
%首先定义频率变量和指标变量

fp=800;
fs=1000;
fc=4000;
ripple=0.5;
attenuation=40;

wp=fp*2*pi/fc;
ws=fs*2*pi/fc;
tr_width=ws-wp;
N=ceil(12*pi/tr_width)+1;
wc=(wp+ws)/2;
h=fir1(N,wc/pi,hann(N+1));
[H,w]=freqz(h,1,1000);
mag=abs(H);db=20*log10(mag/max(mag));
subplot(2,1,1);
plot(w/pi,db,'-b','LineWidth',1);
xlabel("\omega/\pi");ylabel("幅度(dB)");grid on;
subplot(2,1,2);
plot(w/pi,w,'-k','LineWidth',1);
xlabel('\omega/\pi');ylabel('相位(度)');grid on;
