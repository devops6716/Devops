#!/bin/bash 

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/${0##*/}-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "Script started at $TIMESTAMP" &>>$LOG_FILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "  Error.... $2 $R failed $N" 
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
    echo "You are root"
fi

for PACKAGE in "$@"
do 
    echo "Checking if $PACKAGE is installed..." &>>$LOG_FILE

    # Check if the package is installed
    yum list installed "$PACKAGE" &>>$LOG_FILE
    INSTALL_STATUS=$?

    if [ $INSTALL_STATUS -eq 0 ]; then
        echo "$PACKAGE is already installed"
    else
        echo "Installing $PACKAGE..." &>>$LOG_FILE
        yum install "$PACKAGE" -y &>>$LOG_FILE
        VALIDATE $? "Installation of $PACKAGE"
    fi
done
