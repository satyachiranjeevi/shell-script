#!/bin/bash

#subject, to address, email body
#mail.sh toaddress, subject, emailbody, teamname, alert type


TO_ADDRESS=$1
SUBJECT=$2
EMAIL_BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5


echo "all args : $@"

FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/Message/$EMAIL_BODY/g" email-format.html)

echo "$FINAL_BODY" | mail -s "$SUBJECT" $TO_ADDRESS