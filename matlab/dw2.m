%%%%%****************   比较ZF和MMSE检测算法性能 ***************%
%%%%%****************   detec_mimo.m ***************%
%%%%%****************  date:2021年9月19日     author:飞蓬大将军 ***************%

%************版本说明：
%2021年9月19日 调制方式改成QPSK，正确
%注意biterr(x,y,k)中k参数使用，默认也可以

%仿真V-BLAST结构MMSE检测算法性能，调制方式为QPSK
% clear all;
Nt = 4; %发射天线数
Nr = 4; %接收天线数
N = 10; %每帧的长度
L = 10000; %仿真的总帧数
EbN0 = 3:1:10;

% EbN0 = 100; %用于调试
M = 4; %QPSK调制
x = randi([0,M-1],N*L,Nt); %信源数据
s = pskmod(x,M,pi/4); %QPSK调制,未采用格雷码映射，下同

ber1 = zeros(1,length(EbN0));
ber2 = zeros(1,length(EbN0));
ber3 = zeros(1,length(EbN0));

for index=1:length(EbN0)
    x1 = [];
    x2 = [];
    x3 = [];
    for index1 = 1:L
        h = randn(Nt,Nr)+1j*randn(Nt,Nr); %Rayleigh衰落信道
        h = h./sqrt(2); %信道系数归一化
        
        sigma1 = sqrt(1/2)*sqrt(1/(10.^(EbN0(index)/10))); %每根接收天线的高斯白噪声标准差
        n = sigma1*(randn(N,Nr)+1j*randn(N,Nr)); %每根接收天线的高斯白噪声
        
 
        %********************  信号通过信道 ****************%
        y = s((index1-1)*N+1:index1*N,:)*h+n; 
        
        %*******************  接收端处理 **************%
        %%%%%假设已经通过信道估计知道了h，均不考虑干扰消除
        %%%%  MMSE检测
        yy = y;
        wmmse = h'*inv(h*h'+2*sigma1.^2*diag(ones(1,Nt))); 
        y1 =  y*wmmse; %MMSE检测
        temp1 = pskdemod(y1,M,pi/4); %解调
        x1 = [x1;temp1]; 
        
        %%%% ZF检测
        wzf = h'*inv(h*h');
        y2 = y*wzf; %ZF检测
        temp2 = pskdemod(y2,M,pi/4); %解调
        x2 = [x2;temp2];   
    end
    
    [temp3,ber1(index)] = biterr(x,x1,log2(M)); %MMSE检测时的系统误码
    [temp4,ber2(index)] = biterr(x,x2,log2(M)); %ZF检测时的系统误码
    
end

%%%%%%瑞利衰信道下，QPSK理论误码率
% EbN0 = 3:1:10;

for i = 1:length(EbN0)
    EbN0_l(1,i) = 10^(EbN0(1,i)/10);
    ber3(1,i) = (1/2) *(1-sqrt(EbN0_l(1,i)./(EbN0_l(1,i)+1))); 
end

semilogy(EbN0,ber1,'-ko',EbN0,ber2,'-ro',EbN0,ber3,'-go');
title('MIMO不同算法检测性能')
legend('MMSE算法','ZF算法', '理论值')
xlabel('比特信噪比Eb/N0')
ylabel('误比特率（BER）')
grid on

%%%****************** 实验结果 ************************%%%
%%%%%  留有问题：
%%%%%（1）定义EbN0画理论值是否有意义呢，因为信道矩阵的影响，接收端的EbN0与发送端的EbN0是不一样的了
%%%%%（2）MMSE一直比ZF好，未出现ZF比MMSE的情况

%%%%%%***************** 实验结论   ************************%%%
%%%%%%  MMSE算法明显好于ZF 
%%%%%  2021年9月19日
            
            