#!/bin/bash

NUMBER=$1

#Print if the number is grater than 10 or not

if [ $NUMBER -ge 10 ]
then 
    echo "Given number $NUMBER is greater than 10"
else
    echo "Given number $NUMBER is not greater than 10"
fi