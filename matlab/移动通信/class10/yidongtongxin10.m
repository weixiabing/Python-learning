clc;clear;close all;
r=5;%�Ĵ�������
N=2^r-1;%����
a=ones(1,r);%ones��������ȫ1��
m=zeros(1,N);
source1=randi([0,1],1,1000);%��������Ϊ1000��0,1������
for i=1:1000 %BPSK����
    msgbpsk1(i)=2*source1(i)-1;%0��1������ת��Ϊ-1,1������
end
source2=randi([0,1],1,1000);%��������Ϊ1000��0,1������
for i=1:1000 %BPSK����
    msgbpsk2(i)=2*source2(i)-1;%0��1������ת��Ϊ-1,1������
end
source3=randi([0,1],1,1000);%��������Ϊ1000��0,1������
for i=1:1000 %BPSK����
    msgbpsk3(i)=2*source3(i)-1;%0��1������ת��Ϊ-1,1������
end
polynomial = [5 2 0];
reg1=[1 0 0 0 0];
mCode1 = mCodeGen(polynomial,reg1);
reg2=[1 1 0 0 0];
mCode2 = mCodeGen(polynomial,reg2);
reg3=[1 0 1 0 0];
mCode3 = mCodeGen(polynomial,reg3);
for i=1:31%m1����BPSK����
    m1(i)=2*mCode1(i)-1;%ת��Ϊ-1,1������
end
for i=1:31%m2����BPSK����
    m2(i)=2*mCode2(i)-1;%ת��Ϊ-1,1������
end
for i=1:31%m3����BPSK����
    m3(i)=2*mCode3(i)-1;%ת��Ϊ-1,1������
end
kp1=ds_mod(m1(:),msgbpsk1);
   %���ƺ��ԭ��Ϣ����ƺ��m������˺���Ƶ
kp2=ds_mod(m2(:),msgbpsk2);%���ƺ��ԭ��Ϣ����ƺ��m������˺���Ƶ
kp3=ds_mod(m3(:),msgbpsk3);
error=[];%������
kp=kp1+kp2+kp3;
 snr= [ -30 -25 -20 -15 -10 -5 0 ];%��ͬ�������
for k=1:7 
 awgnbpsk(k,:)=awgn(kp,snr(k),'measured');%�����������Ľ�����  
   awgnbpsk=awgnbpsk';
    bpsk1=ds_demod(m1(:),awgnbpsk(:,k));
    bpsk2=ds_demod(m2(:),awgnbpsk(:,k));
    bpsk3=ds_demod(m3(:),awgnbpsk(:,k));
    awgnbpsk=awgnbpsk';
    org1=[];%�����Ľ����ź�
    for n=1:1000
        org1(n)=sign(bpsk1(n));%-1,1��������Ϊ0,1������
    end
    org2=[];%�����Ľ����ź�
    for n=1:1000
        org2(n)=sign(bpsk2(n));%-1,1��������Ϊ0,1������
    end
    org3=[];%�����Ľ����ź�
    for n=1:1000
        org3(n)=sign(bpsk3(n));%-1,1��������Ϊ0,1������
    end
   error1(k)=1-length(find(msgbpsk1==org1))/1000;
   error2(k)=1-length(find(msgbpsk2==org2))/1000;
   error3(k)=1-length(find(msgbpsk3==org3))/1000;
end
figure(1);
out3=(error3+error2+error1)/3;
semilogy(out3,'r-*');hold on
grid on;

source=randi([0,1],1,1000);%��������Ϊ1000��0,1������
for i=1:1000 %BPSK����
    msgbpsk(i)=2*source(i)-1;%0��1������ת��Ϊ-1,1������
end
polynomial = [5 2 0];
reg=[1 0 0 0 0];
mCode = mCodeGen(polynomial,reg);
for i=1:31%m����BPSK����
    m(i)=2*mCode(i)-1;%ת��Ϊ-1,1������
end
kp=ds_mod(m(:),msgbpsk);
error=[];%������
 snr=[ -30 -25 -20 -15 -10 -5 0 ];%��ͬ�������
for k=1:7 
awgnbpsk(k,:)=awgn(kp,snr(k),'measured');%�����������Ľ����ź�
  awgnbpsk=awgnbpsk';
    bpsk=ds_demod(m(:),awgnbpsk(:,k));
    awgnbpsk=awgnbpsk'; 
    org=[];%�����Ľ����ź�
    for n=1:1000
        org(n)=sign(bpsk(n));%-1,1��������Ϊ0,1������
    end
   error(k)=1-length(find(msgbpsk==org))/1000;
end
out1=error;
semilogy(out1);
set(gca,'XTickLabel',[ -30 -25 -20 -15 -10 -5 0 ]);
grid on;
title('BPSK������');
legend('���û�','���û�');
