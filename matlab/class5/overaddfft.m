function y = overaddfft(x, h, L)
    %****.**重叠相加法***************
    % x为输入的信号序列x(n)
    %h为LTI的单位冲激响应序列h(n)
    % L为对信号序列x的分段长度
    M = length(h);

    if L < M
        L = M + 1;
        %保证信号的分段长度L大于M
    end

    N = M + L - 1;
    Lx = length(x);
    T = ceil(Lx / L);
    %取整
    t = zeros(1, M - 1);
    x = [x, zeros(1, (T + 1) * N - Lx)];
    %补零使之能够刚好分成整数段
    y = zeros(1, (T + 1) * L);
    %输出序列的总长度(T+1)* L
    for i = 0:1:T
        %分段计算
        xi = i * L + 1;
        x_seg = x(xi:xi + L - 1);
        %取- .段信号赋给变量x _seg
        y_seg = fftconv(x_seg, h, N);
        %调用快速卷积函数fftconv()
        y_seg(1:M - 1) = y_seg(1:M - 1) + t(1:M - 1); %M-1 点重叠相加
        t(1:M - 1) = y_seg(L + 1:N);
        %取当前段前M-1点
        y(xi:xi + L - 1) = y_seg(1:L);
        %将各段计算结果衔接起来
    end

    y = y(1:Lx + M - 1);
    %输出最后结果
