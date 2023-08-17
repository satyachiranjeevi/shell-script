#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"


VALIDATE()
{
    if ( $1 -ne 0 )
    then
        echo -e "installation $R FAILED $N for $2"
    else
         echo -e "installation $G Successful for $N for $2"
    fi
}

for args in $@
do
    Yum install $args -y

    VALIDATE $? $args
done