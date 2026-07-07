#!/bin/bash

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)    
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

mkdir -p /home/ec2-user/shellscript-logs

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # If user is not providing number of days, we are taking 14 as default

USAGE(){
    echo "USAGE:: sh 16-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>(optional)"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR Does not exists"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR Does not exists"
    exit 1
fi

echo "Script started execting at:: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime $DAYS)

echo "Files are:: $FILES"

