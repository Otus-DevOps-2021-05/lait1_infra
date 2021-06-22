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

#Команда для создания инстанса с метадатой
```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=metadata.yaml
```