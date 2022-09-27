# Werefire_microservices
Werefire microservices repository

---

## HW №20

Добавлены k8s манифесты

* Ingress Controller
* Ingress
* Secret
* TLS
* LoadBalancer Service
* Network Policies
* PersistentVolumes
* PersistentVolumeClaims

---

## HW №19

* Развернуто локальное окружение для работы с Kubernetes
  * minikube 1.19
* Развернут Kubernetes в Yandex Cloud
  * смотрится дорохо-бохато
* Деплой reddit в Kubernetes Yandex Cloud
  * деплойменты и сервисы из  локального minikube, без изменений, запущены в Kubernetes Yandex Cloud

---

## HW №18

* Компоненты Kubernetes развернуты вручную с помощью kubeadm
* Базовые YAML манифесты добавлены и проверены в Kubernetes
* Использвана документация kubeadm https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
* Изучена разница Kubernetes 1.19 и 1.25 и варианты запуска в k8s на локальной машине
* Испытана боль запуска разворачивания k8s wsl2 в win11. docker & containerD
* Испытано Docker Desktop Kubernetes

---

## HW №17

* Подготовлено окружение
* Логирование Docker-контейнеров
* Сбор неструктурированных логов
* Визуализация логов
* Сбор структурированных логов
* Распределенный трейсинг

---

## HW №16

* Prometheus: запуск, конфигурация, знакомство с Web UI
  * Создан Docker образ на основе готового образа с DockerHub с конфигурацией для мониторинга микросервисов
  * Сконфигурирован Prometheus
  * Собран docker-compose.yml для запуска приложения в своих сетях\алиасах с системой мониторинга Prometheus
* Мониторинг состояния микросервисов
* Сбор метрик хоста с использованием экспортера
  * Для Prometheus собран докер-образ c node-exporter
* Образы схоронены в DockerHub

---

## HW №15

* Собран инстанс в YC (использовался cpu=2 ram=8)
* Gitlab-CI развернут в Docker Swarm с 4 runner


    docker-machine create --driver generic --generic-ip-address=51.250.72.234 --generic-ssh-user appuser --generic-ssh-key C:/Users/NAME/.ssh/appuser docker-host
    docker-machine ls
    docker-machine env docker-host
    @FOR /f "tokens=*" %i IN ('"C:\ProgramData\chocolatey\lib\docker-machine\bin\docker-machine.exe" env docker-host') DO @%i
    docker-machine ls
    docker swarm init
    docker stack deploy --compose-file docker-compose.yml mystack

* Зарегистрированы Gitlab-runner Gitlab-CI. В ходе выполнения добавлял раннеры для параллелизма


    docker exec -it mystack_gitlab-runner.1.q8d7ajvqmrrmbq31x0119xh0y gitlab-runner register --url http://51.250.72.234/ --non-interactive --locked=false --name DockerRunner --executor docker --docker-image alpine:latest --registration-token GR1348941J2syT-wGUEgx8GQeScdF --tag-list "linux,xenial,ubuntu,docker" --run-untagged


* В .gitlab-ci.yml использовано динамическое окружение


---

## HW №14

* Запуск проекта с помощью docker-compose
* Запуск проекта в двух сетях


    networks:
      - front_net
      - back_net
* Параметризация переменных окружения с помощью файла .env


    USERNAME=your-dockerhub-login
    UI_PORT=80
    MONGO_VER=3.2
    FRONTNET_SUBNET_PREF=10.0.1.0/24
    BACKNET_SUBNET_PREF=10.0.2.0/24

* Имя проекта формируется из имени корневой папки с docker-compose
  * Ключ -p меняет это имя
    * `docker-compose -p Имя-проекта up -d`


---

## HW №13

* Приложение разделено на несколько компонентов в разных докер-образах
* Создали bridge-сеть для контейнеров, так как сетевые алиасы не
работают в сети по умолчанию
* Запустили наши контейнеры в этой сети
* Добавили сетевые алиасы контейнерам
* В удалённом YC инстансе подключен Docker volume `docker volume create reddit_db`, который примонтируется к контейнеру MongoDB

---

## HW №12

* Создан docker host
  * в ОС WIN операционка сама говорит что выполнить (см. выхлоп docker-machine ls и docker-machine env docker-host из cmd)
* Создан свой образ
  * билд на хосте в YC, запуск там же
* Работа с Docker Hub
  * пуш в репу Docker Hub, пулл+проверка в локальной среде

---
