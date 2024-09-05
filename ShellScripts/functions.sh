#!/bin/bash

ID=$(id -u)
VALIDATE(){
    if [ $? -ne 0 ]
then
    echo " Installation failed"
    exit 1
else
    echo " Installation success"      
fi
}
if [ $ID -ne 0 ]
then
    echo " Error.... Please run with root access"
    exit 1
else
    echo " You are root"
fi

yum install -y 
VALIDATE
yum install git -y
VALIDATE