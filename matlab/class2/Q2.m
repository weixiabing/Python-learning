close all;
clc;
clear ;
B=[1,0.9];A=[1,-0.9];
%绘制系统函数H(z)的幅度和相位
[H,w]=freqz(B,A,512);
figure(1);
subplot(2,1,1);
plot(w/pi,abs(H));
title('幅度响应');
xlabel('归一化频率');
ylabel('幅度');
subplot(2,1,2);
plot(w/pi,angle(H));
title('相位响应');
xlabel('归一化频率');
ylabel('相位');
%绘制系统函数h(n)
figure(2)
h=impz(B,A);
stem(h,'.')
title('系统函数h(n)')
xlabel('n')
ylabel('h(n)')
%绘制系统函数H(e^jw)幅度特性曲线
figure(3)
plot(w/pi,abs(H))
title('系统函数H(e^j^w)幅度特性曲线')
xlabel('归一化频率')
ylabel('幅度')

%求h[n]的表达式
syms z n
h=iztrans((1+0.9*z^(-1))/(1-0.9*z^(-1)),n)



