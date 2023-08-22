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

cp mongo.repo /etc/yum.repos.d/mongo.repo &>> $LOGFILE

VALIDATE $? "Copied MongoDB repo into yum.repos.d"

yum install mongodb-org -y &>> $LOGFILE

VALIDATE $? "Installation of MongoDB"

systemctl enable mongod &>> $LOGFILE

VALIDATE $? "Enabling MongoDB"

systemctl start mongod &>> $LOGFILE

VALIDATE $? "Starting MongoDB"

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>> $LOGFILE

VALIDATE $? "Edited MongoDB conf"

systemctl restart mongod &>> $LOGFILE

VALIDATE $? "Restarting MonogoDB"