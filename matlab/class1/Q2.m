close all;
clc;
clear ;
n=0:50;
B1=[0.5,0.27,0.77] ;A1=1;
B2=[0.45,0.5,0.45];A2=[1,-0.53,0.46];
subplot(2,1,1);
hn1=impz(B1,A1,n);
stem(n,hn1,'.');
title('系统1的冲激响应序列');
xlabel('n');ylabel('h(n)');
subplot(2,1,2);
hn2=impz(B2,A2,n);
stem(n,hn2,'.');
title('系统2的冲激响应序列');
xlabel('n');ylabel('h(n)');


