#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$( echo $0 | cut -d "." -f1 )"
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOG_FOLDER

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
dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL alredy installed ..$Y SKIPPING $N"
fi

# install nginx servere
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "NGINX"
else
    echo -e "NGINX is alredy installed ..$Y SKIPPING $N"
fi
