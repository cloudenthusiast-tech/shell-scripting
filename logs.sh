#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"


mkdir -p $LOGS_FOLDER
echo "script executed in: $(date)"

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



dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then

dnf install mysql -y   &>>$LOG_FILE
VALIDATE $? "mysql"
else
   echo -e "mysql already exist .... $Y SKIPPING $N"
fi



dnf list installed redis &>>$LOG_FILE
if [ $? -ne 0 ]; then

dnf install redis -y   &>>$LOG_FILE
VALIDATE $? "redis"
else
   echo -e "redis already exist .... $Y SKIPPING $N"
fi



dnf list installed nodejs &>>$LOG_FILE
if [ $? -ne 0 ]; then

dnf install nodejs -y  &>>$LOG_FILE
VALIDATE "$?" "nodejs"
else
	echo -e "nodejs already exit .... $Y SKIPPING $N"
fi


