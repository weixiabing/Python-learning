function mCode = mCodeGen(polynomial,reg)
    % m序列产生器函数
    % polynomial为本原多项式次数，如对x^5+x^2+1，polynomial = [5 2 0]
    % reg为置寄存器初始值,也相当于PN码的初始相位，如初态为[1 0 0 0 0]时，寄存器初始状态如上图所示
    
    ntap = length(polynomial);
    grade = polynomial(1); % 延时级数
    mlen = 2^grade-1; % m序列一个周期的长度
    mCode = zeros(1,mlen);
    tap = grade+1-polynomial(1:ntap-1); % 抽头位置
    
    % 产生一个周期的PN码
    % 寄存器为 0 0 0 0 1 右边输出
    for i = 1:mlen
        mCode(i)=reg(1);        
        m = mod(sum(reg(tap)),2);
        reg(1:grade-1) = reg(2:grade);
        reg(grade) = m;
    end
end
