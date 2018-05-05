# Aleksgav_infra
Aleksgav Infra repository

Master: [![Build Status](https://travis-ci.org/Otus-DevOps-2018-02/Aleksgav_infra.svg?branch=master)](https://travis-ci.org/Otus-DevOps-2018-02/Aleksgav_infra)


## HOMEWORK 11
Установил Virtualbox & Vagrant
Описал локальную инфраструктуру в Vagrant файле
Добавил Ansible профижинер в Vagrant фаил
Проверил профижинер
Разделил роль db на отдельные файлы тасков
Параметризовал роль
Параметризовал unit фаил puma сервера
Параметризовал deploy плейбук
Дополнил кофигурацию Vagrant для корректной работы проксирования nginx
Установил Molecule & Testinfra
Создал тесты для роли db
Описал тестовую машину
Прогнал тесты - все ок
Написал тест проверку - слушает ли mongo порт
Добавил роли app и db в packer шаблоны
Вынес роль в отдельный репозиторий
Подкючил travis для этгго репозитория
Настроил оповещения о билде в слак чат


## HOMEWORK 10

Ansible-3: [![Build Status](https://travis-ci.org/Otus-DevOps-2018-02/Aleksgav_infra.svg?branch=ansible-3)](https://travis-ci.org/Otus-DevOps-2018-02/Aleksgav_infra)

Перенес созданные плейбуки в отдельные роли
Разделил на два окружения
Добавил вывод информации об окружении
Добавил коммюнити роль nginx
Проверил плейбуки и роли на всех окружениях
Добавил открытие 80 порта в терраформе
Зашифровал секреты с помощью Ansible vault
Вернул динамические инвентори
Настроил валидацию в TravisCI


## HOMEWORK 9

Создал плейбук для управления конфигурацией и деплоя
Создал сценарий для mongo
Создал шаблон конфига для mongo
Добавил хэндлеры
Создал Unit для приложения
Создал шаблон для приложения
Разбил поейбук на несколько плейбуков
Создал динамик инвентори для GCP
Изменил провижининг в Packer
Интегрировал Ansible в Packer
Перебилдил пакером образы


## HOMEWORK 8

Установил Python, pip
Установил ansible
Создал инфраструктуру
Создал инвентори фаил, протестировал
Создал ansible.cgf, протестировал
Создал группу хостов, протестировал
Создал yaml инвентори, протестировал
Протестировал работу модулей command, shell, systemd
Создал простой плейбук
Создал json инвентори

>>> Теперь выполните ansible app -m command -a 'rm -rf ~/reddit' и проверьте еще раз выполнение плейбука. Что изменилось и почему?

Перед удалением папки с репозиторием энсибл писал что ничего измененно не было (changed=0), после удаления репозитория напиал что изменения были (changed=1)


## HOMEWROK 7

Создал инфраструктуру.
Определил ресурс файервола.
Импортировал существующую инфраструктуру в терраформ.
Добавил неявную зависимость от IP адреса.
Добавил новые шаблоны пакера: app и db, создал из них новые образы.
Объявил правила фаервола для монго дб.
Разбил конфигурацию по файлам.
Вынес конфигурации app и db в модули.
Создал модуль vpc.
Параметризировал модули.
Проверил vpc введя другой IP.
Разбил конфигурацию на stage и prod.
Добавил сторадж бакет.


#### Задание со *

Добавил хранение стейт фалй а удаленном бэкенде.
Перенес конфигурационные файлы в terraform_remote_backend_test.
Запустил terraform apply одновременно из terraform_remote_backend_test и родительской папки.
Получил ошибку:

>>> Error locking state: Error acquiring the state lock: writing "gs://tf-reddit-state/terraform/state/default.tflock" failed: googleapi: Error 412: Precondition Failed, conditionNotMet


#### Задание со *

Вернул провижинеры для деплоя приложения.
Добавил провижинер для настроек монго дб.
Запустил и проверил.

Так и не понял как делать отключение провижинера от значения переменной....

## HOMEWORK 6

- Пересобрал образ пакером
- Удалил ключи из метаданных
- Установил terraform
- Инициализировал terraform проект
- Добавил ресурс для создания инстанса
- Создал outputs.tf
- Добавил провижинеры
- Создал variables.tf
- Определил переменные
- Определил переменную для приветного ключа
- Определил переменную для зоны
- Отформатировал конфигурационные файлы терраформа
- Выполнил задание с * , и **

Задание с *
>>> Опишите в коде терраформа добавление ssh ключа пользователя appuser1 в метаданные проекта. Выполните terraform apply и проверьте результат (публичный ключ можно брать пользователя appuser);

Проверил - есть коннект по имени appuser1

>>> Опишите в коде терраформа добавление ssh ключей нескольких пользователей в метаданные проекта (можно просто один и тот же публичный ключ, но с разными именами пользователей, например appuser1, appuser2 и т.д.). Выполните terraform apply и проверьте результат;

Ошибка: google_compute_project_metadata.default: Error, key 'ssh-keys' already exists in project 'infra-198222'

>>> Добавьте в веб интерфейсе ssh ключ пользователю appuser_web в метаданные проекта. Выполните terraform apply и проверьте результат;

Ошибка - тк terraform удалил ключ appuser_web

Задание с **

>>> Какие проблемы вы видите в такой конфигурации приложения?

Недостатки: отсутствие автоматического добавления инстансов, конфигурация будет раздуваться в зависимости от количества инстансов.

## HOMEWORK 5

- Установлен Packer
- Создан шаблон для базового образа ubuntu16
- Параметризирован шаблон
- Создан immutable шаблон
- Создан скрипт для создания инстанса из immutable шаблона

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
