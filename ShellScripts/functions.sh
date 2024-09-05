#!/bin/bash

ID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo " Error.... $2 failed"
    exit 1
else
    echo " $2 installation success"      
fi
}
if [ $ID -ne 0 ]
then
    echo " Error.... Please run with root access"
    exit 1
else
    echo " You are root"
fi

yum install mysql -y 
VALIDATE $? " Installing sql" 
yum install git -y
VALIDATE $? " Installing git"