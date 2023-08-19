#!/bin/bash

#install  multiple packages on Linux Machine

USERID=$(id -u)
SCRIPT_NAME=$0
DATE=$(date +%F)
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m" #Red color
G="\e[32m" #Green color
N="\e[0m"  #Normal color

#1. Check if User is root user or not. If not, show error message and exit from the script
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Only root user can perform this activity. $N Kindly login as Root User and continue. "
    exit 1
fi

VALIDATE()
{
    if [ $1 -ne 0 ]
    then   
        echo -e " $R Installing $2 is failed. $N"
        exit 1
    else
        echo -e " $G Installing $2 is successful. $N"
    fi
}

# 2. Install all pakages based on the input arguments
# check if its already installed,if not continue installing all the packages

for args in $@
do
    yum list installed $args &>>$LOGFILE

    if [ $? -ne 0 ]
    then
        echo -e " $R $args is not installed. It will be installed now $N"
        yum install $args -y &>>$LOGFILE
        VALIDATE $? $args
    else
        echo -e " $R already $args was installed on this machine $N "
    fi
done


# for args in $@
# do
#     yum install $args -y &>>$LOGFILE

#     VALIDATE $? $args -y &>>$LOGFILE
# done

# 2. Check if User is root user or not. If not, show error message and exit from the script