close all;
clc;
clear ;

N = 6; % 信道数
hsl = []; % 呼损率
rmd1 = [0.0106 0.0141 0.0184 0.0209 0.0284];
Ave_Call_Duration = [3 4 5] * 60 * 100;


for rmd = rmd1 % 呼叫到达速率
    for Ave_call = Ave_Call_Duration % 平均通话时长
        C=zeros(1,N); % 信道使用情况
        hs=0; % 呼损次数
        ta=0;
        hjcs=0; % 呼叫次数
        while hjcs<3000
            % 产生一定间隔的，一定服务时间的呼叫
            if ta==0
                hjcs=hjcs+1;
                ta=round(exprnd(1/rmd)*100); % 呼叫到达时间间隔
                tl=round(exprnd(Ave_call)); % 呼叫服务时间
                temC=find(C==0); % 找出信道是否空闲

                if isempty(temC)
                    hs=hs+1;
                else
                    C(temC(1))=tl; % 空闲（0）信道，赋值tl
                end
            else
                ta=ta-1;
            end
            % 时间步进
            C=C-1;
            C(C == -1) = C(C == -1) + 1;; % 表示信道被释放
        end
        % 统计不同到达速率和平均呼叫时间下的呼叫损失概率
        call_loss_probability = hs/hjcs;
        hsl = [hsl; rmd, Ave_call, call_loss_probability];
    end
end

%% 画出呼叫损失概率同达速率之间的关系曲线（包括理论值曲线）
figure;
hold on;
grid on;
markers = {'o', 's', 'd'}; % 不同的标记符号

for i = 1:length(Ave_Call_Duration)
    indices = find(hsl(:, 2) == Ave_Call_Duration(i));
    plot(hsl(indices, 1), hsl(indices, 3), 'LineWidth', 2, 'Marker', markers{i});
    
    % 计算并绘制理论值曲线
    theoretical_hsl = arrayfun(@(x) ErlangB(N, x * Ave_Call_Duration(i)/100), rmd1);
    plot(rmd1, theoretical_hsl, '--', 'LineWidth', 2, 'Marker', markers{i});
end

xlabel('到达速率');
ylabel('呼叫损失概率');
title('呼叫损失概率与到达速率之间的关系（包括理论值曲线）');
legend('实际值 (平均呼叫时间 = 3分钟)', '理论值 (平均呼叫时间 = 3分钟)', ...
       '实际值 (平均呼叫时间 = 4分钟)', '理论值 (平均呼叫时间 = 4分钟)', ...
       '实际值 (平均呼叫时间 = 5分钟)', '理论值 (平均呼叫时间 = 5分钟)');
hold off;

%% 画出服务时间和呼叫损失概率之间的关系曲线
figure;
hold on;
grid on;
markers = {'o', 's', 'd','*','x'}; % 不同的标记符号
for i = 1:length(rmd1)
    indices = find(hsl(:, 1) == rmd1(i));
    plot(hsl(indices, 2), hsl(indices, 3), 'LineWidth', 2,'Marker', markers{i});

   theoretical_hsl = arrayfun(@(x) ErlangB(N, rmd1(i) * x/100), Ave_Call_Duration);
    plot(Ave_Call_Duration, theoretical_hsl, '--', 'LineWidth', 2, 'Marker', markers{i});
end

xlabel('服务时间（平均通话时长）');
ylabel('呼叫损失概率');
title('服务时间和呼叫损失概率')
legend('实际值 (0.0106)', '理论值 (0.0106)', ...
       '实际值 (0.0141)', '理论值 (0.0141)', ...
       '实际值 (0.0184)', '理论值 (0.0184)', ...
       '实际值 (0.0209)', '理论值 (0.0209)', ...
       '实际值 (0.0284)', '理论值 (0.0284)');
hold off;

function erlangB = ErlangB(N, A)
    num = A^N / factorial(N);
    den = 0;
    for k = 0:N
        den = den + (A^k) / factorial(k);
    end
    erlangB = num / den;
end
