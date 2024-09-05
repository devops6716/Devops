#!/bin/bash

NUMBER=$1

# if condition to check entered number is greater than 100

# one way to use && 
#if [[ $NUMBER -gt 100  && $NUMBER -lt 200 ]] 
if [ $NUMBER -gt 100 ] && [ $NUMBER -lt 200 ]
then
    echo "$NUMBER is greater than 100"
else
    echo "$NUMBER is lesser than 100"  
fi      

