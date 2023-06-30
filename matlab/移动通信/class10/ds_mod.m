%参数c为使用的伪随机码
%参数x为输入的信息信号
%参数y为得到的扩频后的信号
function y = ds_mod(c,x)
tmp = c*x;
y = tmp(:);
end
