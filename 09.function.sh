#!/bin/bash

#install nginx 

USERID=$(id -u)
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE()
{
    #function statements

    if [ $1 -ne 0 ]
    then
        echo -e "installation is $R failed $N for $2"
        exit 1
    else
        echo -e "Installation is $G success $N for $2"
    fi

}

if [ $USERID -ne 0]
then
    echo "ERROR:: pleae run the script with root access"
    exit 1
#else
#   echo "INFO:: You are root user"
fi

yum install nginxxx -y &>>$LOGFILE

VALIDATE $? "nginx"

yum install postfixxx -y &>>$LOGFILE

VALIDATE $? "postfix"