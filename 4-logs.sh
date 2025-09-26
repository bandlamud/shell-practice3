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

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$( echo $0 | cut -d "." -f1 )"
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
VALIDATE() {
if [ $1 -ne 0 ]; then
    echo "ERROR: install $2 is failure"
    exit 1
else
    echo "installing  $2 is success"
fi
}

# if package is not found
dnf list installed Mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "mysql already installed..$Y SKIPPING $N"
fi

#if package is not found
dnf list installed Nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "NGINX"
else
    echo -e "nginx already installed... $Y SKIPPING $N"
fi

#if package is not found
dnf list installed Python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "PYTHON3"
else
    echo -e "python3 alreday installed ..$Y SKIPPING $N"
fi
