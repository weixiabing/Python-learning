sum1=0
sum2=0
for  i in `seq 1 2`; do
        read num
        if [ `expr $num % 2` -eq 0 ];then
            echo "输入的数字是偶数"
            sum1=$(($sum1+$num))
        else
            echo "输入的数字是奇数"
            sum2=$(($sum2+$num))
        fi
done
echo "sum1=$sum1,sum2=$sum2"
















