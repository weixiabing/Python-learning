clear all;
clc;

%% 生成m序列
m_sequence1 = generateMSequence([1 0 0 0 0 1 1]);
m_sequence2 = generateMSequence([1 1 0 0 1 1 1]);
m1=(m_sequence1+1)/2;
m2=(m_sequence2+1)/2;
%% m1自相关函数
autocorr_m1 = xcorr(m1);
figure;
stem(autocorr_m1);
title('m1自相关函数');
xlabel('Lag');
ylabel('Correlation');

%%m2自相关函数
autocorr_m2 = xcorr(m2);
figure;
stem(autocorr_m2);
title('m2自相关函数');
xlabel('Lag');
ylabel('Correlation');

%% m1,m2互相关函数
crosscorr_m1m2 = xcorr(m_sequence1, m_sequence2);
figure;
stem(crosscorr_m1m2);
title('m1,m2互相关函数');
xlabel('Lag');
ylabel('Correlation');


%% 产生随机发送信息，并进行BPSK调制
source1 = randi([0, 1], 1, 500);
source2 = randi([0, 1], 1, 500);
bpsk_data1 = 2 * source1 - 1;
bpsk_data2 = 2 * source2 - 1;

%% 使用m序列作为扩频码，产生扩频信号
dsss_data1 = spreadSignal(bpsk_data1, m_sequence1);
dsss_data2 = spreadSignal(bpsk_data2, m_sequence2);

% Single User Scenario
data1 = dsss_data1;

% Two User Scenario
data2 = data1 + dsss_data2;



%% 对扩频发送信号加入白噪声，得到接收扩频信号
SNR_dB = [-20:1:5];
ber_single = zeros(1, length(SNR_dB));
ber_two = zeros(1, length(SNR_dB));

for i = 1:length(SNR_dB)
    % 对发送信号加入白噪声
    bpsk_awgn1 = awgn(data1, SNR_dB(i), 'measured');
    bpsk_awgn2 = awgn(data2, SNR_dB(i), 'measured');
    
    
    % 对接收信号进行解扩和解调
    de_data1 = despreadingAndDemodulation(bpsk_awgn1, m_sequence1);
    de_data2 = despreadingAndDemodulation(bpsk_awgn2,m_sequence2);
    
    
    % 计算误码率
    ber_single(i) = sum(abs(de_data1 - source1)) / length(source1);
    ber_two(i) =sum(abs(de_data2 - source2)) / length(source2);
    
end

%% 绘制误码率曲线
smooth_window = 5; % 平滑窗口大小
error_bpsk1_smoothed = smoothdata(ber_single, 'movmean', smooth_window);
error_bpsk2_smoothed = smoothdata(ber_two, 'movmean', smooth_window);
figure;
semilogy(SNR_dB, error_bpsk1_smoothed, 'b-*', 'LineWidth', 2);
hold on;
semilogy(SNR_dB, error_bpsk2_smoothed, 'r-o', 'LineWidth', 2);
title('Bit Error Rate Comparison');
xlabel('SNR (dB)');
ylabel('Bit Error Rate');
legend('Single User', 'Two Users');
grid on;

%% 生成m序列的函数
function m_sequence = generateMSequence(fx)
    a = fx;
    m_sequence = [];
    
    for i = 1:63
        m_sequence = [m_sequence a(1)];
        k = a(1);
        a = a(:,2:end);
        a = [a mod((k + a(5)), 2)];
    end
    
    m_sequence = 2 * m_sequence - 1;
end

%% 扩频信号生成的函数
function dsss_data = spreadSignal(data, m_sequence)
    dsss_data = kron(data, m_sequence);
end

%% 解扩和解调的函数
function de_data = despreadingAndDemodulation(signal, m_sequence)
    num_symbols = length(signal) / length(m_sequence);
    de_data = zeros(1, num_symbols);
    
    for i = 1:num_symbols
        start_idx = (i - 1) * length(m_sequence) + 1;
        end_idx = i * length(m_sequence);
        received_signal = signal(start_idx:end_idx);
        de_data(i) = received_signal * m_sequence' / length(m_sequence);
    end
    
    de_data = sign(de_data);
end
