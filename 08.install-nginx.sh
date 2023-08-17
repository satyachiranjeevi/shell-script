#!/bin/bash

#install nginx 

USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "ERROR:: pleae run the script with root access"
    esit 1
#else
#   echo "INFO:: You are root user"
fi

yum install nginx -y

if [ $? -ne 0 ]
then
    echo "Error installing nginx"
else
    systemctl enable nginx
    systemctl start nginx
fi