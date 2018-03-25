# Aleksgav_infra
Aleksgav Infra repository

## HOMEWORK 5

Установлен Packer
Создан шаблон для базового образа ubuntu16
Параметризирован шаблон
Создан immutable шаблон
Создан скрипт для создания инстанса из immutable шаблона

## HOMEWORK 4

Стартап скрипт
```
gcloud compute instances create reddit-app \
  --zone europe-west1-d \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script='wget -O - https://gist.githubusercontent.com/Aleksgav/63ed764cf1d153deb8ff745a69837c6f/raw/2a690a6265378c4168ccbfefed11c4e23e2b3e8a/startup_script.sh | bash'
```

Правило для брэндмауэра
```
gcloud compute firewall-rules create default-puma-server \
  --direction=INGRESS \
  --priority=1000 \
  --network=default \
  --action=ALLOW \
  --rules=tcp:9292 \
  --source-ranges=0.0.0.0/0 \
  --target-tags=puma-server
```

### Данные для проверки

```
testapp_IP = 35.187.66.215
testapp_port = 9292
```


## HOMEWORK 3

Подключение к someinternalhost в одну команду:
```bash
ssh -A -J appuser@104.155.68.235 appuser@10.132.0.3
```

Подключение к some internalhost командой вида ssh someinternalhost:
из рабочей папки проекта нужно выполнить команду:
```bash
ssh -F .ssh/config someinternalhost
```
Если нужно сделать еще короче: ssh someinternalhost, тогда настройки из
.ssh/config нужно перенести в глобальный ssh config

### Данные для проверки

```
bastion_IP = 104.155.68.235
someinternalhost_IP = 10.132.0.2
```
