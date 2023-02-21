clear all;
clc;
f1=2;f2=2.02;f3=2.07;%频率
fs=10;%抽样频率
Ts=1/fs;%抽样间隔
Tp1=25.6;%信号记录时长
N1=Tp1/Ts;F1=fs/N1;%频谱分辨率
n1=0:N1-1;
xa1=sin(2*pi*f1*n1/fs)+sin(2*pi*f2*n1/fs)+sin(2*pi*f3*n1/fs);%信号
Xa1=DFTfor(xa1);Xa1_abs=abs(Xa1);
figure(1)
plot(0:(fs)/(N1-1):fs,Xa1_abs/N1,'-b');
grid on;
xlabel('\omega(x\pi)');ylabel('幅度');title('幅度谱');


Tp2=102.4;
N2=Tp2/Ts;
F2=fs/N2;
n2=0:N2-1;
xa2=sin(2*pi*f1*n2/fs)+sin(2*pi*f2*n2/fs)+sin(2*pi*f3*n2/fs);
Xa2=DFTfor(xa2);Xa2_abs=abs(Xa2);
figure(2)
plot(0:(fs)/(N2-1):fs,Xa2_abs/N2,'-b');
grid on;
xlabel('\omega(x\pi)');ylabel('幅度');title('幅度谱');

