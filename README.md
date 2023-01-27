# lbnv13_microservices
lbnv13 microservices repository

## HW-12,13
### Docker-2
### Основное задание
Установлен docker
Создан docker-host в yandex cloud
Создан образ, добавлен в docker hub
### Задание с *
Создана директория infra
#### Ansible:
Написаны плэйбуки:
- docker_install - устанавливает docker
- deploy - разворачивает контейнер из docker hub
- site делает всё сразу
Работает с yc_compute
#### Packer
Создает образ c docker, использует docker_install
#### Terraform
Создет инстансы в yandex cloud из образа пакер. Кол-во задается переменной
