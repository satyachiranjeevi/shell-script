#!/bin/bash

USERS=("user1" "user2" "user3")

# for first user 
echo "First person : ${USERS[0]}"

# for all users 
echo "Second person : ${USERS[@]}"