function [N,omegac]=butterworthord(wp,ws,rp,rs)
%wp为通带边界频率，ws为阻带边界频率，rp为通带最大衰减，rs为阻带最小衰减
if wp<0
    error('通带截止频率必须大于0');
end
if ws<=wp
    error('阻带截止频率必须大于通带截止频率');
end
if (ws<0)|(rs<0)
    error('阻带截止频率和阻带最小衰减必须大于0');
end
N=ceil(log10((10^(0.1*rp)-1)/(10^(0.1*rs)-1))/(2*log10(wp/ws)));
omegac=ws/(10^(0.1*rs)-1)^(1/(2*N));
