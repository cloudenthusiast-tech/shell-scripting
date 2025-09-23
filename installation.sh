#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

if [ $USERID -ne 0 ]; then
   echo -e " $R error:: please run with root user previliges $N"
   exit 1  #it will exit from the script execution if encountered error
fi

VALIDATE(){
	if [ $1 -ne 0 ]; then
   echo -e "error:: installing $2 ... $R  $N"
   exit 1

else
   echo -e "$G installing $2 is SUCCESS"
fi
}



dnf list installed mysql
if [ $? -ne 0 ]; then

dnf install mysql -y
VALIDATE $? "mysql"
else
   echo -e "mysql already exist .... $Y SKIPPING $N"
fi



dnf list installed redis
if [ $? -ne 0 ]; then

dnf install redis -y
VALIDATE $? "redis"
else 
   echo -e "redis already exist .... $Y SKIPPING $N"
fi



dnf list installed nodejs
if [ $? -ne 0 ]; then
   
dnf install nodejs -y
VALIDATE "$?" "nodejs"
else 
  echo -e "nodejs already exist .... $Y SKIPPING $N"
fi 

