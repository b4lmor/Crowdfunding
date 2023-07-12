# Проект "Crowdfunding platform", разработанный для ШИФТ Интенсива

## Запуск

1. Запускаем Apache Cassandra (docker-compose.yaml)
2. Накатываем скрипт scripts/init.cql на БД
3. Запускаем сервис

## Технологии/зависимости

### Java

В рамках проекта используется Java версией 17. Скачать можно по ссылке: https://bell-sw.com/pages/downloads/#downloads

### Docker

Для поднятия БД нужен докер. Скачать его можно по ссылке: https://www.docker.com/products/docker-desktop/

### База данных

В качестве БД используем Apache Cassandra 4. Скачать и запустить можно с помощью Docker команды из проекта:

```console
docker-compose up -d
```

### Запуск .jar файла

После инициализации БД, запустите .jar файл:

```console
java -jar .\crowdfunding-1.0.0.jar
```

### Создание админа

После того, как проект запустился, необходимо создать администратора:

- Для этого зарегистрируйте пользователя с логином Admin.