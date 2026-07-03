#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You Must have SUDO Access to perform this action"
    exit 1
fi

dnf list installed mysql
       if [ $? -ne 0 ]
    then
        dnf install mysql -y
        if [ $? -ne 0 ]
    then
        echo "Installing MYSQL...FAILURE"
        exit 1
    else
        echo "Installing MYSQL...SUCCESS"
    fi
else
    echo "MYSQL has already been....INSTALLED"
fi


dnf list insatlled git
       if [ $? -ne 0 ]
    then
        dnf install git -y
        if [ $? -ne 0 ]
        then
            echo "Installing GIT...FAILURE"
            exit 1
        else
            echo "Installing GIT...SUCCESS"
        fi
else
    echo "GIT has already been...INSTALLED"
fi
