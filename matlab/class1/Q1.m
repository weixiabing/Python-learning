close all;
clc;
clear ;
n=0:299;
B1=[0.5,0.27,0.77] ;A1=1;
B2=[0.45,0.5,0.45];A2=[1,-0.53,0.46];
x1=cos(20*pi*n/256)+cos(200*pi*n/256);
hn1=filter(B1,A1,x1);
hn2=filter(B2,A2,x1);
subplot(4,1,1);stem(n,x1,'.');
title('系统1的输入');
xlabel('n');ylabel('x(n)');
subplot(4,1,2);stem(n,hn1,'.');
title('系统1的输出');
xlabel('n');ylabel('y(n)');
subplot(4,1,3);stem(n,x1,'.');
title('系统2的输入');
xlabel('n');ylabel('x(n)');
subplot(4,1,4);stem(n,hn2,'.');
title('系统2的输出');
xlabel('n');ylabel('y(n)');