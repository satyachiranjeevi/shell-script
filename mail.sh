#!/bin/bash

#subject, to address, email body
#mail.sh toaddress, subject, emailbody, teamname, alert type


TO_ADDRESS=$1
SUBJECT=$2
EMAIL_BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
echo "escapged content: $EMAIL_BODY"
TEAM_NAME=$4
ALERT_TYPE=$5


echo "all args : $@"

FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/Message/$EMAIL_BODY/g" email-format.html)

echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" $TO_ADDRESS