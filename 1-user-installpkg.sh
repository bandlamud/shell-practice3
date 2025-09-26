#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]; then
    echo "ERROR:: Run the script with root Privilages"
fi

# Install the packae
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "ERROR: install mysql is failure"
else
    echo "install my sql is success"
fi