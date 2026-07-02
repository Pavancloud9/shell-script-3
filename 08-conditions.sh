#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 200 ]
then
    echo "Given number is greater than 200"
else
    echo "Given number is less than or equal to 200"
fi