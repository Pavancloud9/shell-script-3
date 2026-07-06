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

# if [ $USERID -ne 0 ]
# then
#     echo "You Must have SUDO Access to perform this action"
#     exit 1
# fi

SOURCE_DIR="/home/ec2-user/app-logs"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "Files to be deleted:: $FILES_TO_DELETE"

