function y=cirshftt(x,m,N)
if length(x)>N
error
    ('N must be >= the length of x')
end
x=[x,zeros(1,N-length(x))];%补零
n=0:N-1;
n=mod(n-m,N);%循环移位
y=x(n+1);%取出对应的值
