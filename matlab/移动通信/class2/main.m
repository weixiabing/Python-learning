close all;
clc;
clear ;
r=500;%小区半径
N=6;%信道数
hsl=[];%呼损率
dhl=[];
rmd1=[0.0050 0.0100 0.0150 0.0200 0.0250]*10;
for rmd=rmd1;%呼叫到达速率   
    C0=zeros(1,N);%0面信道使用情况
    C1=zeros(1,N);%1面信道使用情况
    V0=zeros(N,2);
    V1=zeros(N,2);
    location0=zeros(N,2);
    location1=zeros(N,2);
    hs=0;%呼损次数
    ta=0;
    hjcs=0;%呼叫次数
    Handover_Num = 0;%切换次数
    dhcs=0;%掉话次数
    while hjcs<1000
        if ta==0
            hjcs=hjcs+1;
            ta=round(exprnd(1/rmd)*100);
            tl=round(exprnd(6000));
            [x v]=generate(r);
            if(x(3)==0)
                temC0=find(C0==0);
                if length(temC0)==0
                    hs=hs+1;
                else
                    V0(temC0(1),:)=v;
                    location0(temC0(1),:)=[x(1),x(2)];
                    C0(temC0(1))=tl;
                end
            end;
            if(x(3)==1)
                temC1=find(C1==0);
                if length(temC1)==0
                    hs=hs+1;
                else
                    V1(temC1(1),:)=v;
                    location1(temC1(1),:)=[x(1),x(2)];
                    C1(temC1(1))=tl;     
                end
            end
        else
            ta=ta-1;
        end
        %时间步进
        V0(find(C0==1),:)=0;     %检查信道使用情况，释放掉
        location0(find(C0==1),:)=0;
        V1(find(C1==1),:)=0;
        location1(find(C1==1),:)=0;
        C0=C0-1;
        C0(find(C0==-1))=C0(find(C0==-1))+1;
        C1=C1-1;
        C1(find(C1==-1))=C1(find(C1==-1))+1;
        for(n=1:6)
            location0(n,:)=location0(n,:)+V0(n,1)*[cos(V0(n,2)) sin(V0(n,2))];
            if inorout(location0(n,:)/r)==0
                Handover_Num = Handover_Num + 1;
                [location0(n,:),transto]=newloc([location0(n,1) location0(n,2)]);
                temC1=find(C1==0);
                if length(temC1)==0
                    dhcs=dhcs+1;
                    V0(n,:)=0;
                    location0(n,:)=0;
                    C0(n)=0;
                else
                    V1(temC1(1),:)=V0(n,:);
                    location1(temC1(1),:)=location0(n,:);
                    C1(temC1(1))=C0(n);
                    V0(n,:)=0;
                    location0(n,:)=0;
                    C0(n)=0;
                end;
            end;  
        end
        %1->0面切换相关处理及掉话统计
        for n = 1:N
            location1(n,:) = location1(n,:)+V1(n,1)*[cos(V1(n,2)) sin(V1(n,2))];
            if inorout(location1(n,:)/r)==0
                Handover_Num = Handover_Num + 1;
                [location1(n,:),transto] = newloc([location1(n,1) location1(n,2)]);
                temC0 = find(C0==0);
                if length(temC0)==0
                    dhcs = dhcs+1;
                    V1(n,:) = 0;
                    location1(n,:) = 0;
                    C1(n) = 0;
                else
                    V0(temC0(1),:) = V1(n,:);
                    location0(temC0(1),:) = location1(n,:);
                    C0(temC0(1))=C1(n);
                    V1(n,:)=0;
                    location1(n,:)=0;
                    C1(n)=0;
                end
            end
        end
    end
    temphsl=hs/hjcs;
    tempdhl=dhcs/Handover_Num;
    hsl = [hsl temphsl];
    dhl = [dhl tempdhl];
end
delete(gcp('nocreate'))
figure;
plot(rmd1,hsl,'-d')
hold on;
plot(rmd1,dhl,'-*')
legend('呼损率', '切换失败率')
xlabel('呼叫到达速率');
ylabel('呼损率/切换失败率');
title('呼损率/切换失败率与呼叫到达速率关系曲线');


function ioo = inorout( data )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
ioo=1;    
if data(1)>sqrt(3)/2
    ioo=0;
elseif data(1)<-sqrt(3)/2
    ioo=0;
elseif data(2)>-data(1)/sqrt(3)+1
   ioo=0;
elseif data(2)>data(1)/sqrt(3)+1
   ioo=0;
elseif data(2)<data(1)/sqrt(3)-1
   ioo=0;
elseif data(2)<-data(1)/sqrt(3)-1
   ioo=0;
end;
end
 

function [x,v] = generate(r)
%v为数组，第一个表示速率，第二个表示角度
% x为数组，第一个第二个表示位置，第三个表示正反面
a=rand(1,2);
a=a*2-1;
check1=inorout(a);
while(check1==0)
    a=rand(1,2);
    a=a*2-1;
    check1=inorout(a);
end
x=r*a;
zf=round(rand(1,1));
x=[x,zf];
zt=rand(1)*2*pi;
[v]=rand(1)*(2.5+0.5)/2/100+(0.5+3)/2/100;
v=[v zt];
end
 

function [ newlocation,transto] = newloc(location)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
transto=0;
r=500;
if inorout((location-r*[sqrt(3) 0])/r)
    newlocation=location-r*[sqrt(3) 0];
    transto=1;
elseif inorout((location-r*[sqrt(3)*cos(pi/3) sqrt(3)*sin(pi/3)])/r)
    newlocation=location-r*[sqrt(3)*cos(pi/3) sqrt(3)*sin(pi/3)];
    transto=1;
elseif inorout((location-r*[-sqrt(3)*cos(pi/3) sqrt(3)*sin(pi/3)])/r)
    newlocation=location-r*[-sqrt(3)*cos(pi/3) sqrt(3)*sin(pi/3)];
    transto=1;
elseif inorout((location-r*[-sqrt(3) 0])/r)
    newlocation=location-r*[-sqrt(3) 0];
    transto=1;
elseif inorout((location-r*[-sqrt(3)*cos(pi/3) -sqrt(3)*sin(pi/3)])/r)
    newlocation=location-r*[-sqrt(3)*cos(pi/3) -sqrt(3)*sin(pi/3)];
    transto=1;
elseif inorout((location-r*[sqrt(3)*cos(pi/3) -sqrt(3)*sin(pi/3)])/r)
    newlocation=location-r*[sqrt(3)*cos(pi/3) -sqrt(3)*sin(pi/3)];
    transto=1;
end
    if transto==0
    newlocation=location;
end
end

