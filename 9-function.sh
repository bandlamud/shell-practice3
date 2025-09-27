#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root Privilages"
    exit 1
fi

VALIDATE() {
if [ $1 -ne 0 ]; then
    echo "installing $2 is failure"
    exit 1
else
    echo "installing $2 is success"
fi
}

# installed packages
dnf install mysql -y
VALIDATE $? "MYSQL"

# install nginx servere
dnf install nginx -y
VALIDATE $? "NGINX"
