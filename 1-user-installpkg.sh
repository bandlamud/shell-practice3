#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Run the script with root Privilages"
    exit 1
fi

# Install the packae
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "ERROR: install mysql is failure"
    exit 1
else
    echo "install my sql is success"
fi

dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "installing nginx is failure"
else
    echo "installing nginx is success"
fi

dnf install python3
if [ $? -ne 0 ]; then
    echo "installing python3 is failure"
else
    echo "installing python3 is success"
fi
