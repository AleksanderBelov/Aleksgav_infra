# Aleksgav_infra
Aleksgav Infra repository

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
