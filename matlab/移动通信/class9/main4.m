clear all;
clc;

%% 生成m序列
m_sequence = generateMSequence();

%% 产生随机发送信息，并进行BPSK调制
source = randi([0, 1], 1, 10000);
bpsk_data = 2 * source - 1;

%% 使用m序列作为扩频码，产生扩频信号
dsss_data = spreadSignal(bpsk_data, m_sequence);

%% 对扩频发送信号加入白噪声，得到接收扩频信号
SNR_dB = [-30:1:10];
ber_dsss = zeros(1, length(SNR_dB));

for i = 1:length(SNR_dB)
    % 对发送信号加入白噪声
    bpsk_awgn = awgn(dsss_data, SNR_dB(i), 'measured');
    
    % 对接收信号进行解扩和解调
    de_data = despreadingAndDemodulation(bpsk_awgn, m_sequence);
    
    % 计算误码率
    ber_dsss(i) = sum(abs(de_data - source)) / length(source);
end

%% 不进行扩频的系统
ber_bpsk = zeros(1, length(SNR_dB));

for i = 1:length(SNR_dB)
    % 对发送信号加入白噪声
    bpsk_awgn = awgn(bpsk_data, SNR_dB(i), 'measured');
    
    % 对接收信号进行解调
    de_data = sign(bpsk_awgn);
    
    % 计算误码率
    ber_bpsk(i) = sum(abs(de_data - source)) / length(source);
end


%% 绘制误码率曲线

smoothed_ber_dsss = smoothdata(ber_dsss, 'movmean', 5); % 使用移动平均进行平滑处理
smoothed_ber_bpsk = smoothdata(ber_bpsk, 'movmean', 5); % 使用移动平均进行平滑处理
subplot(2,1,1);
stairs((m_sequence+1)/2);
title('M Sequence');
xlabel('Index');
ylabel('Amplitude');
ylim([0 1])
grid on;
subplot(2,1,2);
semilogy(SNR_dB, smoothed_ber_dsss, 'DisplayName', 'BPSK DSSS');
hold on;
semilogy(SNR_dB, smoothed_ber_bpsk, 'DisplayName', 'BPSK');
title('Smoothed BER Curve');
xlabel('SNR (dB)');
ylabel('Bit Error Rate');
legend('Location', 'best');
grid on;

%% 生成m序列的函数
function m_sequence = generateMSequence()
   a = [1 0 0 1 0 1];
    m_sequence = [];
    
    for i = 1:63
        m_sequence = [m_sequence a(1)];
        k = a(1);
        a=a(:,2:end) ;
        a=[a mod((k+a(5)),2)];
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
