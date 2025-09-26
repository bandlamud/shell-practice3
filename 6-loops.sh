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
echo "Script execution time is: $(date)"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Run the script with root Privilages"
    exit 1 # failure is  other then 0
fi

VALIDATE() { #function take inputs through args just like shell script
if [ $1 -ne 0 ]; then
    echo "ERROR: installing  $2 is $R FAILURE $N"
    exit 1
else
    echo "installing  $2 is $G SUCCESS $Y"
fi
}

for package in $@
do

    echo ""package is $package


done

