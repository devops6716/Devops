#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo " Error.... $2 failed" 
    exit 1
else
    echo " $2  success"      
fi
}
if [ $ID -ne 0 ]
then
    echo " Error.... Please run with root access"
    exit 1
else
    echo " You are root"
fi

yum install mysql -y &>>$LOG_FILE

VALIDATE $? " Installing sql" 

yum install git -y &>>$LOG_FILE

VALIDATE $? " Installing git"