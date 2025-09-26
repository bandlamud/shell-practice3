#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Run the script with root Privilages"
    exit 1
fi

VALIDATE() {
if [ $1 -ne 0 ]; then
    echo "ERROR: install $2 is failure"
    exit 1
else
    echo "install $? is success"
fi
}

# if package is not found
dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "mysql already installed..$Y SKIPPING $N"
fi

#if package is not found
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e "nginx already installed... $Y SKIPPING $N"
fi

#if package is not found
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "PYTHON3"
else
    echo -e "python3 alreday installed ..$Y SKIPPING $N"
fi
