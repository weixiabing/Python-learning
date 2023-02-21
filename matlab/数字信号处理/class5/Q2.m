clear;clc;close all;
n=0:200;x=n;
h=[1,0,3,7];
L=5;
ya=overaddfft(h,x,L);
yc=conv(x,h);
ym=fftfilt(h,x,L+length(h)-1);
stem(0:length(ya)-1,ya,'.');
title('重叠相加法计算线性卷积');
 