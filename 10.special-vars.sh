#!/bin/bash

VAR=$1
VAR=$2

echo "variable 1 : $VAR"

#All variables
echo "all vars : $@"

# number of  variables
echo "number of vars : $#"

# script name
echo "script name : $0"