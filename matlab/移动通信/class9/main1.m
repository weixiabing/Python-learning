clear all;
clc;
clear
%(1)m序列扩频
%产生随机发送信息，并进行BPSK调制：
source1=randi([0,1],1,1000);
source2=randi([0,1],1,1000);
source3=randi([0,1],1,1000);

BPSK_data1=2*source1-1;
BPSK_data2=2*source2-1;
BPSK_data3=2*source3-1;

BER=[];
BER1=[];
DSSS_data1=[];
DSSS_data2=[];
DSSS_data3=[];

De=[];

a=[1 0 0 1 0 1];
%生成周期长度为31的m序列：
m1=[];
m2=[];
m3=[];
for i=1:63  
    m1=[m1 a(1)];   
    k=a(1);    
    a=a(:,2:end) ;    
    a=[a mod((k+a(5)),2)] 
end
m1=2*m1-1;

for i=1:63  
    m2=[m2 a(1)];   
    k=a(1);    
    a=a(:,2:end) ;    
    a=[a mod(a(1)+a(2)+a(5),2)] ;
end
m2=2*m2-1;

for i=1:63  
    m3=[m3 a(1)];   
    k=a(1);    
    a=a(:,2:end) ;    
    a=[a mod(a(2)+a(3)+a(5),2)] ;
end
m3=2*m3-1;

%使用m序列作为扩频码，产生扩频信号：
for i=1:1000
    
    DSSS_data1=[DSSS_data1 BPSK_data1(i)*m1];
    DSSS_data2=[DSSS_data2 BPSK_data2(i)*m2];
    DSSS_data3=[DSSS_data3 BPSK_data3(i)*m3];
   
end


DSSS_data22=DSSS_data1+DSSS_data2;                %  2用户
DSSS_data33=DSSS_data1+DSSS_data2+DSSS_data3;      %  3用户
%对扩频发送信号加入白噪声，得到接收扩频信号：
for SNR=[-30 -20 -10 -5 0 5 10];
    BPSK_AWGN=awgn(DSSS_data1,SNR,'measured');
    for i=1:1000
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


for SNR=[-30 -20 -10 -5 0 5 10];
    BPSK_AWGN=awgn(DSSS_data33,SNR,'measured');
    for i=1:1000
        temp=BPSK_AWGN((i-1)*63+1:63*i);
        De(i)=temp*m1'/63;
        De_data(i)=sign(De(i));
    end
    BPSK_ber=sum(abs(De_data-BPSK_data3))/2000;
    BER=[BER BPSK_ber];
end


figure(2);
semilogy(BER);
title('3用户BPSK直接序列扩频系统的误码率');
grid on;
