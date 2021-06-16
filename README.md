# lait1_infra
lait1 Infra repository

#Подключение к внутреннему хосту
С помощью ProxyCommand в конфиге ssh
ssh someinternalhost попадаем сразу на нужный хост без внешнего IP

bastion_IP = 178.154.230.66
someinternalhost_IP = 10.128.0.19

#Настройка ~/.ssh/config
```
host someinternalhost
   Hostname 10.128.0.19
   User appuser
   Port 22
   ProxyCommand ssh -i ~/.ssh/appuser -A appuser@178.154.230.66 -p 22 -W %h:%p
```
