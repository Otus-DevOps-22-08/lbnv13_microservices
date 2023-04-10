# lbnv13_microservices
lbnv13 microservices repository

## HW-21
### kubernetes-3
#### Основное задание
Проверено использование LoadBalancer
Использован Ingress
Применен Network Policy
Добавлены PersistentVolume и PersistentVolumeClaim. Проверена доступность данных бд после перезапуска.
#### Задание с **
Описан создаваемый объект Secret в виде Kubernetes-манифеста.
Файл ui-ingress-secret.yml. Лишние метаданые закомментированы.

## HW-20
### kubernetes-2
#### Основное задание
Развернуто локальное окружение для работы с Kubernetes 
Для minikube использован Virtualbox
Развернут Kubernetes в Yandex Cloud
Запущен reddit в Kubernetes
#### Задание с **
Кластер поднимается терраформом 
Дашборд запускается из каталога dashboard.
kubectl apply -f ./kubernetes/dashboard -n kubernetes-dashboard
Для того чтобы открыть дашборд:
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep dashboard-admin | awk '{print $1}')
Получаем токен доступа. 
Далее запускаем kubectl proxy -n kubernetes-dashboard 
и получаем дашборд на локалхосте. 
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/namespace?namespace=default
вводим токен, который получили



## HW-19
### gitlab-ci-1
#### Основное задание
Подготовлена инсталляция Gitlab CI
Описаны этапы пайплайна
Определены окружения
#### Задание с **
.Инстанс поднимается терраформом
2.Гитлаб ставится через ansible-playbook ./playbooks/install_gitlab.yml
Встарые споcобы получения токена depricated, потому разделено на 2 плейбука.
После разворота гитлаба надо запустить ansible-playbook ./playbooks/runner.yml.
Плейбук выведет дефолтный пароль для root (для удобства), и попросит ввести токен.
Вводим токен полученный в веб интерфейсе и получаем зарегистрированный раннер.
Для пайплайна (build_job) используется докерхаб образ из предыдущих дз lbnvd13/otus-reddit:1.0

## HW-18
### kubernetes-1
#### Основное задание
Установлен и настроен kubernetes
#### Задание с **
Реализована установка кластера k8s с помощью terraform и ansible.
##### terraform:
cd kubernetes/terraform && terraform apply 
создает мастер и воркер инстансы. кол-во воркеров задается переменной
##### ansible:
cd kubernetes/ansible && ansible-playbook /playbooks/install.yml
настраивает мастер и воркер ноду,инвентори динамический через yc_compute 
подключает воркер ноды к мастеру

## HW-17
### logging-1
#### Основное задание
Применено централизованное логирование в EFK-стеке
Собраны структурированные и неструктурированные логи
Добавлены grok-шаблоны 
Добавлен Zipkin
#### Задание с *
Добавлен grok-шаблон для парсина message
В микросервисах баг time.sleep(3) в post_app.py

## HW-16
### Monitoring-1
#### Основное задание
Переупорядочена структура директорий
Запущен и сконфигурирован prometheus 
Настроен мониторинг микросервисов
Добавлен Node exporter
Собранные образы загружены на DockerHub
#### Задание с *
Добавлен мониторинг MongoDB (percona/mongodb_exporter)
Добавлен Blackbox exporter (prom/blackbox-exporter)
В корне репозитория добавлен Makefile (собирает образы, пушит, стартует локально compose 
по умолчаниюв выводит информацию с командами)

## HW-15
### Docker-4
#### Основное задание
Рассмотрены разные виды сети в docker
Проект запущен в двух bridge сетях
Проект пересобран с помощью docker-compose
docker-compose.yml перестроен под несколько сетей
Параметризованы версии сервисов, порт ui
Имя проекта можно изменить с помощью COMPOSE_PROJECT_NAME, можно указать в .env
#### Задание с *
Создан docker-compose.override.yml
Запускает puma с необходимыми параметрами
Приложения вынесены в volume для редактирования кода без пересборки образов.

## HW-14
### Docker-3
#### Основное задание
Инфраструктура разбита на компоненты, каждый в своем контейнере, настроена сеть.
Настроен Volume для MongoDB
#### Задание с *
Для comment и ui сделаны образы на снове ruby:2.2-alpine
Образы < 150 мб

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
