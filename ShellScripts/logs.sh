#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"
echo " Script started at $TIMESTAMP" &>>$LOG_FILE
VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo -e "  Error.... $2  $R failed $N" 
    exit 1
else
    echo -e "  $2 $G success $N"      
fi
}
if [ $ID -ne 0 ]
then
    echo -e " $R Error.... Please run with root access $N"
    exit 1
else
    echo " You are root"
fi

yum install mysql -y &>>$LOG_FILE

VALIDATE $? " Installing sql" 

yum install git -y &>>$LOG_FILE

VALIDATE $? " Installing git" 