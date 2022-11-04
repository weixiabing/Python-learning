close all;
clc;
clear ;
D=10;
n=0:50;
B2=[0.45,0.5,0.45];A2=[1,-0.53,0.46];
x1=cos(20*pi*n/256)+cos(200*pi*n/256);
xd=[zeros(1,D),x1];
ic=[0 0];
y=filter(B2,A2,x1,ic);
yd=filter(B2,A2,xd,ic);
N=length(y);
d=y-yd(1+D:N+D);
subplot(3,1,1);
stem(n,y,'.');
title('y');
xlabel('n');ylabel('信号幅度');
subplot(3,1,2);
stem(n,yd(11:length(yd)),'.');
title('yd');
xlabel('n');ylabel('信号幅度');
subplot(3,1,3);
stem(n,d,'.');
title('差值信号');
xlabel('n');ylabel('信号幅度');