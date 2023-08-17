#!/bin/bash

#install nginx 

USERID=$(id -u)

VALIDATE()
{
    #function statements

    if [ $1 -ne 0 ]
    then
        echo "installation is failed"
        exit 1
    else
        echo "Installation is success"
    fi

}

if [ $USERID -ne 0]
then
    echo "ERROR:: pleae run the script with root access"
    exit 1
#else
#   echo "INFO:: You are root user"
fi

yum install nginx -y

VALIDATE $?

yum install postfixxx -y

VALIDATE $?