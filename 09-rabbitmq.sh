component=rabbitmq
source common.sh

dnf install rabbitmq-server -y
cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
systemctl enable rabbitmq-server
systemctl restart rabbitmq-server

rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"