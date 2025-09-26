#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_FILE="$(echo $0 | cut -d "." -f1)"
LOG_FILE="($LOG_FOLDER/$SCRIPT_FILE.log)"
mkdir -p $LOG_FOLDER

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Run the script with root Privilages"
    exit 1
fi

# if package is not found
dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "mysql already installed..$Y SKIPPING $N" 
fi

#if package is not found
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "NGINX"
else
    echo -e "nginx already installed... $Y SKIPPING $N"
fi

#if package is not found
dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "PYTHON3"
else
    echo -e "python3 alreday installed ..$Y SKIPPING $N"
fi


