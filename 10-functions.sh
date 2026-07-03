#!/bin/bash

USERID=$(id -u)

FUNCTION(){
    if [ $1 -ne 0 ]
    then
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
    fi
}
###################################################
if [ $USERID -ne 0 ]
then
    echo "You Must have SUDO Access to perform this action"
    exit 1
fi
###################################################
dnf list installed mysql
       if [ $? -ne 0 ]
    then
        dnf install mysql -y
        FUNCTION $? "Installing...MYSQL"
        
else
    echo "MYSQL has already been....INSTALLED"
fi


dnf list installed git
       if [ $? -ne 0 ]
    then
        dnf install git -y
        FUNCTION $? "Installing...GIT" 
else
    echo "GIT has already been...INSTALLED"
fi
