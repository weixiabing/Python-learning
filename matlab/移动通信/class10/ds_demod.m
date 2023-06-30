%参数c为使用的伪随机码
%参数y为扩频信息信号
%参数y为得到的解扩后的信号
function x = ds_demod(c,y)
tmp=reshape(y,length(c),length(y)/length(c));
tmp=tmp';
x=tmp*c;
x=x';
end
