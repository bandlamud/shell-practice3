#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
echo "execution of  script timing is: $(date)"
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

for package in $@
do
    # pakage is alredy installed or not
    dnf list installed $package

    # if exit status is 0 not installed 1 need to install
    if [ $? -ne 0 ]; then
        dnf install $package
        VALIDATE $? "$package"
    else
        echo "alredy $package is installed..$Y SKIPPING $N"
    fi
    

done