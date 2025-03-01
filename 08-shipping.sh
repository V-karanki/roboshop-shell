component=shipping
source common.sh

dnf install maven -y
cp shipping.service /etc/systemd/system/shipping.service
useradd roboshop

artifact_download

cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar



dnf install mysql -y

mysql -h mysql-dev.vdevops98.online -uroot -pRoboShop@1 < /app/db/schema.sql
mysql -h mysql-dev.vdevops98.online -uroot -pRoboShop@1 < /app/db/app-user.sql
mysql -h mysql-dev.vdevops98.online -uroot -pRoboShop@1 < /app/db/master-data.sql

systemd_setup
