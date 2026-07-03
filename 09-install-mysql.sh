#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You Must have SUDO Access to perform this action"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]
then
    echo "Installing MYSQL...FAILURE"
    exit 1
else
    echo "Installign MYSQL...SUCCESS"
fi

dnf install git -y
if [ $? -ne 0 ]
then
    echo "Installing GIT...FAILURE"
    exit 1
else
    echo "Installing GIT...SUCCESS"
fi
