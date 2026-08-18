#!/bin/bash # Запускает скрипт через Bash

JAVA_VERSION="$1" # Получает требуемую версию Java

echo "Checking Java $JAVA_VERSION..." # Показывает, какую Java проверяем

if java -version 2>&1 | grep -q 'version "21'; then # Проверяет, установлена ли Java 21
    echo "Java 21 is already installed." # Сообщает, что Java 21 уже есть
else # Выполняется, если Java 21 отсутствует
    echo "Java 21 is not installed. Installing..." # Сообщает о начале установки
    sudo apt update # Обновляет список пакетов
    sudo apt install -y openjdk-21-jdk # Устанавливает Java 21
fi # Завершает проверку Java

java -version # Показывает установленную версию Java
