#!/bin/bash

#Install gmail on Linux server


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

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
        echo "$R ERROR: Command $2 execution has got failed $N"
        exit 1
    else
        echo "$G Success: COmmand $2 execution has been successfully completed. $N"
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

echo -e
"relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous" > /etc/postfix/main.cf 

VALIDATE $? "create main.cf"