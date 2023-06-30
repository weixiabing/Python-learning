clear all;
clc;
%(1)m序列扩频
%产生随机发送信息，并进行BPSK调制：
source1=randi([0,1],1,10000);

BPSK_data1=2*source1-1;% BPSK_data2=2*source2-1;
% BPSK_data3=2*source3-1;

BER=[];
BER1=[];
DSSS_data1=[];

De=[];

a=[1 0 0 1 0 1];
%生成周期长度为31的m序列：
m1=[];

for i=1:63  
    m1=[m1 a(1)];   
    k=a(1);    
    a=a(:,2:end) ;    
    a=[a mod((k+a(5)),2)] 
end
m1=2*m1-1;



%使用m序列作为扩频码，产生扩频信号：
for i=1:10000
    
    DSSS_data1=[DSSS_data1 BPSK_data1(i)*m1];

end



%对扩频发送信号加入白噪声，得到接收扩频信号：
for SNR=[-30 -20 -10 -5 0 5 10];
    BPSK_AWGN=awgn(DSSS_data1,SNR,'measured');
    for i=1:10000
        %对接收信号进行解扩
        temp=BPSK_AWGN((i-1)*63+1:63*i);
        De(i)=temp*m1'/63;
        %对接收信号进行BPSK解调：
        De_data(i)=sign(De(i));
    end
    BPSK_ber1=sum(abs(De_data-BPSK_data1))/2000;
    BER=[BER BPSK_ber1];
end
figure(1);
semilogy(BER);
title('1用户BPSK直接序列扩频系统的误码率');
grid on;

