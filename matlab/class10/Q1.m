clc;clear;close all
N=53;
F=[0:1/100:1];
A=[ones(1,45),zeros(1,101-45)];
h=fir2(N,F,A);
figure;
freqz(h);
%设置一个过度点
N=106;
F=[0:1/100:1];
A=[ones(1,45),zeros(1,101-45)];
A(46)=0.5;
h=fir2(N,F,A);
figure;
freqz(h);
%设置两个过度点
N=159;
F=[0:1/100:1];
A=[ones(1,45),zeros(1,101-45)];
A(46)=0.5;
A(47)=0.5;
h=fir2(N,F,A);
figure;
freqz(h);

