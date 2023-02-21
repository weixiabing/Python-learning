unset var
while [ "$var" != "end" ]
do
    echo -n "Enter a number: "
    read var
    if [ "$var" = "end" ]
    then
        break;
    fi
    echo "var is: $var"
done