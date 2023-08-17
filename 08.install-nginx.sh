#!/bin/bash

#install nginx 

USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "ERROR:: pleae run the script with root access"
    exit 1
#else
#   echo "INFO:: You are root user"
fi

yum install nginx -y

if [ $? -ne 0 ]
then
    echo "Error installing nginx"
    exit 1
else
    systemctl enable nginx
    systemctl start nginx
fi

yum install postfix -y

if [ $? -ne 0 ]
then 
    echo "Installation of postfix is error"
    exit 1
else
    echo "Installation of postfix is success"
fi