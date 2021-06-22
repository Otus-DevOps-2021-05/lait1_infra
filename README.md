# lait1_infra
lait1 Infra repository

#Подключение к внутреннему хосту
С помощью ProxyCommand в конфиге ssh
ssh someinternalhost попадаем сразу на нужный хост без внешнего IP

bastion_IP = 84.252.129.182
someinternalhost_IP = 10.128.0.19

#Настройка ~/.ssh/config
```
host someinternalhost
   Hostname 10.128.0.19
   User appuser
   Port 22
   ProxyCommand ssh -i ~/.ssh/appuser -A appuser@84.252.129.182 -p 22 -W %h:%p
```
#Для задания cloud-testapp
testapp_IP = 217.28.228.96
testapp_port = 9292