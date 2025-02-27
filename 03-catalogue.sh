component=catalogue
source common.sh

nodejs_setup

dnf install mongodb-mongosh -y

mongosh --host mongo-dev.vdevops98.online </app/db/master-data.js
