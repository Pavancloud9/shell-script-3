#!/bin/bash

USERID=$(id -u)

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)    ### 13-loops
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE_FUNCTION(){
    if [ $1 -ne 0 ]
    then
       echo "$2....FAILURE"
       exit 1
    else
        echo "$2...SUCCESS"
    fi
}

echo "Script started exectuing at: $TIMESTAMP" &>>LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "You Must have SUDO Access to perform this action"
    exit 1
fi

for PACKAGE in $@
do 
    dnf installed list $PACKAGE
    if [ $? -ne 0 ]
then
    dnf install $PACKAGE -y
    VALIDATE_FUNCTION $? "Installing $PACKAGE"
else
    echo "$PACKAGE is already....INSTALLED"
fi
done


  
