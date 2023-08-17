#!/bin/bash

#install nginx 

USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "ERROR:: pleae run the script with root access"
else
    echo "INFO:: You are root user"
fi

yum install nginx -y

