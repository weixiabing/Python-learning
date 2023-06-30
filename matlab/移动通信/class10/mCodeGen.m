function mCode = mCodeGen(polynomial,reg)
    % m���в���������
    % polynomialΪ��ԭ����ʽ���������x^5+x^2+1��polynomial = [5 2 0]
    % regΪ�üĴ�����ʼֵ,Ҳ�൱��PN��ĳ�ʼ��λ�����̬Ϊ[1 0 0 0 0]ʱ���Ĵ�����ʼ״̬����ͼ��ʾ
    
    ntap = length(polynomial);
    grade = polynomial(1); % ��ʱ����
    mlen = 2^grade-1; % m����һ�����ڵĳ���
    mCode = zeros(1,mlen);
    tap = grade+1-polynomial(1:ntap-1); % ��ͷλ��
    
    % ����һ�����ڵ�PN��
    % �Ĵ���Ϊ 0 0 0 0 1 �ұ����
    for i = 1:mlen
        mCode(i)=reg(1);        
        m = mod(sum(reg(tap)),2);
        reg(1:grade-1) = reg(2:grade);
        reg(grade) = m;
    end
end
