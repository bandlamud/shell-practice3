#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

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

# Already  package installed or not
dnf list installed package
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL alredy installed ..$Y SKIPPING $N"
fi

# install nginx servere
dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e "NGINX is alredy installed ..$Y SKIPPING $N"
fi
