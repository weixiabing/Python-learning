close all;
clc;
clear ;
B=[1,0];A=[1,-0.9];
%画零极点图
figure(1)
zplane(B,A);
title('零极点图');
%画出|H(ejw)|
figure(2)
freqz(B,A);
%求h[n]
figure(3)
[h,t]=impz(B,A);
stem(t,h,'.');
title('h[n]');


