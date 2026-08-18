#!/bin/bash # Запускает скрипт через Bash

JAVA_VERSION="$1" # Получает требуемую версию Java из первого аргумента

if [ -z "$JAVA_VERSION" ]; then # Проверяет, передана ли версия Java
    echo "Error: Java version was not specified." # Сообщает, что версия Java не указана
    exit 1 # Завершает скрипт с ошибкой
fi # Завершает проверку аргумента

echo "Installing Java $JAVA_VERSION..." # Показывает, какую Java собираемся установить

sudo apt update # Обновляет список доступных пакетов

sudo apt install -y wget apt-transport-https gpg # Устанавливает инструменты, необходимые для подключения репозитория

wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/adoptium.gpg # Добавляет ключ репозитория Adoptium

echo "deb https://packages.adoptium.net/artifactory/deb $(. /etc/os-release && echo "$VERSION_CODENAME") main" | sudo tee /etc/apt/sources.list.d/adoptium.list > /dev/null # Добавляет официальный репозиторий Adoptium

sudo apt update # Обновляет список пакетов после добавления репозитория

sudo apt install -y "temurin-${JAVA_VERSION}-jdk" # Устанавливает нужную версию Temurin JDK

echo "Java $JAVA_VERSION installation completed." # Сообщает об успешном завершении установки
