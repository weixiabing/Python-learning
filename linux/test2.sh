#提示输入某个目录文件名，然后输出此目录下的所有的权限，若可读输出reaable',若不可读输出unreadable
#!/bin/bash
echo "请输入一个目录文件名"
read dirname
if [ -d $dirname ]
then
    for file in `ls $dirname`
    do
        if [ -r $dirname/$file ]
        then
            echo "$file is readable"
        else
            echo "$file is unreadable"
        fi
    done
else
    echo "输入的目录文件名不存在"
fi


