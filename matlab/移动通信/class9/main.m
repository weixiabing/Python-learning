clc;close all;clear ;
%% 参数设置
m_sequence_length = 31; % m序列长度
bpsk_bits = randi([0 1], 1, 1000); % 随机生成发送信息，1000个比特
EbNo_dB = 0:2:20; % 信噪比范围（dB）
num_simulations = 1000; % 每个信噪比点的模拟次数

%% 生成m序列
m_sequence = generateMSequence(m_sequence_length);

%% BPSK调制
bpsk_symbols = 2 * bpsk_bits - 1; % 将0/1比特映射为-1/1符号

%% 扩频信号生成
spread_signal = spreadSignal(bpsk_symbols, m_sequence);

%% 信道模拟：加入白噪声
received_signal = addWhiteNoise(spread_signal, EbNo_dB, num_simulations);

%% 解扩
despread_signal = despreadSignal(received_signal, m_sequence);

%% BPSK解调
bpsk_demodulated_bits = (despread_signal > 0); % 大于0的符号解调为1，否则解调为0

%% 计算误码率
bit_errors = sum(bpsk_demodulated_bits ~= bpsk_bits, 2); % 比较接收到的比特与发送比特，统计错误比特数
bit_error_rate = bit_errors / length(bpsk_bits); % 比特误码率

%% 绘制误码率曲线
figure;
semilogy(EbNo_dB, bit_error_rate, '-o');
grid on;
xlabel('Eb/No (dB)');
ylabel('Bit Error Rate');
title('Bit Error Rate vs. Eb/No');

%% 生成m序列的函数
function m_sequence = generateMSequence(length)
    % 初始化寄存器状态
    registers = ones(1, length - 1);
    
    m_sequence = zeros(1, length);
    
    % 生成m序列
    for i = 1:length
        m_sequence(i) = registers(end);
        
        % 计算下一个寄存器状态
        next_state = mod(sum(registers([1 2 5])), 2);
        registers = [next_state registers(1:end-1)];
    end
end

%% 扩频信号生成的函数
function spread_signal = spreadSignal(data, m_sequence)
    spread_signal = kron(data, m_sequence); % 使用m序列进行扩频
end

%% 添加白噪声的函数
function received_signal = addWhiteNoise(signal, EbNo_dB, num_simulations)
    received_signal = zeros(size(signal, 1), length(EbNo_dB), num_simulations);
    
    for i = 1:length(EbNo_dB)
        % 计算每个信噪比点的能量
        EbNo = 10^(EbNo_dB(i) / 10);
        noise_power = 1 / EbNo;
        
        for j = 1:num_simulations
            % 生成高斯白噪声
            noise = sqrt(noise_power/2) * (randn(size(signal)) + 1i * randn(size(signal)));
            
            % 添加噪声到信号
            received_signal(:, i, j) = signal + noise;
        end
    end
end

%% 解扩的函数
function despread_signal = despreadSignal(signal, m_sequence)
    despread_signal = sum(reshape(signal, size(signal, 1), [], length(m_sequence)) .* m_sequence, 3); % 解扩信号
end
