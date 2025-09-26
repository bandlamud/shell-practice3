#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Run the script with root Privilages"
    exit 1
fi

VALIDATE() [
if [ $1 -ne 0 ]; then
    echo "ERROR: install $2 is failure"
    exit 1
else
    echo "install $? is success"
fi

]

# Install the packae
dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "NGINX"

dnf install python3 y
VALIDATE $? "PYTHON3"