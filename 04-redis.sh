component=redis
source common.sh

dnf module disable redis -y
dnf module enable redis:7 -y
dnf install redis -y

sed -i -e 's|127.0.0.1 to 0.0.0.0|' -e '/protected-mode/ c /protected-mode no' /etc/redis/redis.conf

systemctl enable redis
systemctl restart redis