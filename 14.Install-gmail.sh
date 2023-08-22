#!/bin/bash

#Install gmail on Linux server


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

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
        echo -e "$R ERROR: Command $2 execution has got failed $N"
        exit 1
    else
        echo -e "$G Success: COmmand $2 execution has been successfully completed. $N"
    fi
}
# Update yum repo

yum update -y --exclude=kernel*

VALIDATE $? "update kernal"

 # Install Postfix, the SASL authentication framework, and mailx.

yum -y install postfix cyrus-sasl-plain mailx

VALIDATE $? "install postfix"

# Restart Postfix to detect the SASL framework

systemctl restart postfix

VALIDATE $? "restart postfix"

# Start Postfix on boot

systemctl enable postfix 

VALIDATE $? "enable postfix"

# Open the /etc/postfix/main.cf file.

cp mail-main.cf /etc/postfix/main.cf 

VALIDATE $? "create main.cf"

echo "Enter your user name for gmail : "

read USERNAME

echo "user name is $UNAME"

echo "Enter your password for gmail : "

read PASSWORD

echo "PASSWORD is $PASSWORD"

#FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/Message/$EMAIL_BODY/g" email-format.html)

#echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" $TO_ADDRESS

cp mail-cred /etc/postfix/sasl_passwd

sed -i "s/UNAME/duvvu.chiranjeevi@gmail.com" -i "s/PASSWORD/tldlvpkupgrmoxqt" /etc/postfix/sasl_passwd

postmap /etc/postfix/sasl_passwd 

echo "This is a test mail & Date $(date)" | mail -s "message" dschiranjeevi222@gmail.com

