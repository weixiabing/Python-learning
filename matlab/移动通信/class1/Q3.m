% 画出呼叫损失概率同达速率之间的关系曲线
close all;
clc;
clear ;
N=6; % 信道数
hsl=[]; % 呼损率
rmd1=[0.0106 0.0141 0.0184 0.0209 0.0284];
Ave_Call_Duration = [3 4 5]*60*100;

for rmd=rmd1 % 呼叫到达速率
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

                if length(temC)==0
                    hs=hs+1;
                else
                    C(temC(1))=tl; % 空闲（0）信道，赋值tl
                end
            else
                ta=ta-1;
            end
            % 时间步进
            C=C-1;
            C(find(C==-1))=C(find(C==-1))+1; % 表示信道被释放
        end
        % 统计不同到达速率和平均呼叫时间下的呼叫损失概率
        call_loss_probability = hs/hjcs;
        hsl = [hsl; rmd, Ave_call, call_loss_probability];
    end
end

% 画出服务时间和呼叫损失概率之间的关系曲线
figure;
hold on;
grid on;

for i = 1:length(rmd1)
    indices = find(hsl(:, 1) == rmd1(i));
    plot(hsl(indices, 2), hsl(indices, 3), 'o-', 'LineWidth', 2);
end

xlabel('服务时间（平均通话时长，单位：秒）');
ylabel('呼叫损失概率');
title('服务时间和呼叫损失概率')
