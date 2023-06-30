close all;
clc;
clear;

r = 5; % 移位寄存器阶数
a1 = ones(1, r); % 信道一
a2 = ones(1, r); % 信道二
a3 = ones(1, r); % 信道三
N = 2^r - 1; % 周期
number = 1000;
m1 = zeros(1, N); % 信道一的m序列
m2 = zeros(1, N); % 信道二的m序列
m3 = zeros(1, N); % 信道三的m序列

kp1 = []; % 扩频序列一
kp2 = []; % 扩频序列二
kp3 = []; % 扩频序列三

source1 = randi([0, 1], 1, number); % 信道一，产生一组伪随机序列
source2 = randi([0, 1], 1, number); % 信道二，产生一组伪随机序列
source3 = randi([0, 1], 1, number); % 信道三，产生一组伪随机序列

for i = 1:number % 对伪随机序列进行BPSK调制
    msgbpsk1(i) = 2 * source1(i) - 1;
    msgbpsk2(i) = 2 * source2(i) - 1;
    msgbpsk3(i) = 2 * source3(i) - 1;
end

for i = 1:(2^r - 1) % 信道一m序列的生成
    temp = mod((a1(5) + a1(2)), 2);
    for j = r:-1:2
        a1(j) = a1(j - 1);
    end
    a1(1) = temp;
    m1(i) = a1(r);
end

for i = 1:(2^r - 1) % 信道二m序列的生成
    temp = mod((a2(5) + a2(4) + a2(3) + a2(2)), 2);
    for j = r:-1:2
        a2(j) = a2(j - 1);
    end
    a2(1) = temp;
    m2(i) = a2(r);
end

for i = 1:(2^r - 1) % 信道三m序列的生成
    temp = mod((a3(5) + a3(4) + a3(2) + a3(1)), 2);
    for j = r:-1:2
        a3(j) = a3(j - 1);
    end
    a3(1) = temp;
    m3(i) = a3(r);
end

for i = 1:31 % m序列BPSK调制
    m1(i) = 2 * m1(i) - 1;
    m2(i) = 2 * m2(i) - 1;
    m3(i) = 2 * m3(i) - 1;
end

for i = 1:number % 扩频
    temp1 = msgbpsk1(i) * m1;
    kp1 = [kp1 temp1];
    
    temp2 = msgbpsk2(i) * m2;
    kp2 = [kp2 temp2];
    
    temp3 = msgbpsk3(i) * m3;
    kp3 = [kp3 temp3];
end

kp4 = kp1 + kp2; % 两个用户
kp5 = kp1 + kp2 + kp3; % 三个用户
 
error_bpsk1 = []; % 判断一个用户误码
error_bpsk2 = []; % 判断两个用户误码
error_bpsk3 = []; % 判断三个用户误码

for snr = -30:1:10 % 单用户
    bpsk1 = [];
    org1 = [];
    awgnbpsk1 = awgn(kp1, snr, 'measured');
    for i = 1:number
        t1 = awgnbpsk1((i - 1) * 31 + 1:31 * i);
        t2 = t1 * m1' / 31;
        bpsk1 = [bpsk1 t2];
    end
    for n = 1:number
        org1(n) = sign(bpsk1(n));
    end
    ber1 = sum(abs(msgbpsk1 - org1)) / number;
    error_bpsk1 = [error_bpsk1 ber1];
end

for snr = -30:1:10 % 双用户
    bpsk2 = [];
    org2 = [];
    awgnbpsk2 = awgn(kp4, snr, 'measured');
    for i = 1:number
        t1 = awgnbpsk2((i - 1) * 31 + 1:31 * i);
        t2 = t1 * m1' / 31;
        bpsk2 = [bpsk2 t2];
    end
    for n = 1:number
        org2(n) = sign(bpsk2(n));
    end
    ber2 = sum(abs(msgbpsk1 - org2)) / number;
    error_bpsk2 = [error_bpsk2 ber2];
end

for snr = -30:1:10 % 三用户
    bpsk3 = [];
    org3 = [];
    awgnbpsk3 = awgn(kp5, snr, 'measured');
    for i = 1:number
        t1 = awgnbpsk3((i - 1) * 31 + 1:31 * i);
        t2 = t1 * m1' / 31;
        bpsk3 = [bpsk3 t2];
    end
    for n = 1:number
        org3(n) = sign(bpsk3(n));
    end
    ber3 = sum(abs(msgbpsk1 - org3)) / number;
    error_bpsk3 = [error_bpsk3 ber3];
end

% 平滑曲线
smooth_window = 5; % 平滑窗口大小
error_bpsk1_smoothed = smoothdata(error_bpsk1, 'movmean', smooth_window);
error_bpsk2_smoothed = smoothdata(error_bpsk2, 'movmean', smooth_window);
error_bpsk3_smoothed = smoothdata(error_bpsk3, 'movmean', smooth_window);

figure(1);
plot([-30:1:10],error_bpsk1_smoothed, 'b-*', 'LineWidth', 2);
hold on;
plot(-30:1:10,error_bpsk2_smoothed, 'r-o', 'LineWidth', 2);
hold on;
plot(-30:1:10,error_bpsk3_smoothed, 'g-s', 'LineWidth', 2);
legend('单个用户', '两个用户', '三个用户');
xlabel('snr/dB');
ylabel('误码率/Pe');
title('误码率与信噪比SNR的曲线图');
