# Werefire_microservices
Werefire microservices repository

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
