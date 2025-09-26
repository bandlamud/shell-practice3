#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$( echo $0 | cut -d "." -f1 )"
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo "Script execution time is: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root privilages"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR:: installing $2 is failure"
        exit 1
    else
        echo "instaling $2 is success"
    fi
}

dnf list installed mysql &>>$LOG_FILE
# install it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "mysql"
else
    echo -e "mysql already installed.. $Y SKIPPING $N"
fi

dnf list installed nginx &>>$LOG_FILE
# install is not found
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "NGINX"
else
    echo -e "nginx already installed.. $Y SKIPPING $N"
fi

dnf list installed  python3 &>>$LOG_FILE
# install is not found
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "PYTHON3"
else
    echo -e "python3 already installed.. $Y SKIPPING $n"
fi


