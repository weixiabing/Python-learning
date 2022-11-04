close all;
clc;
clear ;
n=0:50;
a=2;
b=-3;
B2=[0.45,0.5,0.45];A2=[1,-0.53,0.46];
x1=cos(20*pi*n/256);
x2=cos(200*pi*n/256);
x=a*x1+b*x2;
y1=filter(B2,A2,x1);
y2=filter(B2,A2,x2);
y=filter(B2,A2,x);
yt=a*y1+b*y2;
subplot(2,1,1);
stem(n,y,'.');
title('y');
xlabel('n');ylabel('信号幅度');
subplot(2,1,2);
stem(n,yt,'.');
title('yt');
xlabel('n');ylabel('信号幅度');