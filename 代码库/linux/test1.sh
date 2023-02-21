#编写shell使用ping检测192.168.3.1~192.168.3.100的网络是否畅通
#!/bin/bash
for i in {1..100}
do
    ping -c 1 192.168.3.$i &>/dev/null
    if [ $? -eq 0 ];then
        echo "192.168.3.$i is ok"
    else
        echo "192.168.3.$i is error"
    fi
done
