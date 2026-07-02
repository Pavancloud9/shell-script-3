#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You must have SUDO Access to perform this action"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]
then

