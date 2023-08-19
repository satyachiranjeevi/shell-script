#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

SCRIPT_NAME=$0
DATE=$(date +%F)
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

VALIDATE()
{
    #function statements

    if [ $1 -ne 0 ]
    then
        echo -e "installation is $R failed $N for $2"
    else
        echo -e "Installation is $G success $N for $2"
    fi

}

for args in $@
do
    yum install $args -y &>>$LOGFILE

    VALIDATE $? $args -y &>>$LOGFILE
done