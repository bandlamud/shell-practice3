#!/bin/bash

USERID=$(id -u)

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
    echo "mysql already installed.. SKIPPING "
fi

#if package is not found
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo "nginx already installed...SKIPPING"
fi

#if package is not found
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "PYTHON3"
else
    echo "python3 alreday installed .. SKIPPING"