#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ]
then
    echo " Error.... Please run with root access"
else
    echo " You are root"
fi
yum install mysql -y 
            