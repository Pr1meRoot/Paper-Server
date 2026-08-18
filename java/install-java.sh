#!/bin/bash # Запускает скрипт через Bash

JAVA_VERSION="$1" # Получает требуемую версию Java

echo "Checking Java $JAVA_VERSION..." # Показывает, какую Java проверяем

if java -version 2>&1 | grep -q 'version "21'; then # Проверяет, установлена ли Java 21

    echo "Java 21 is already installed." # Сообщает, что Java 21 уже установлена

else # Выполняется, если Java 21 не найдена

    echo "Java 21 is not installed. Installing..." # Сообщает о начале установки Java

    sudo apt update # Обновляет список пакетов

    sudo apt install -y openjdk-21-jdk # Устанавливает Java 21 JDK

fi # Завершает проверку Java

echo "" # Добавляет пустую строку

java -version # Показывает установленную версию Java

if [ $? -ne 0 ]; then # Проверяет, удалось ли запустить Java

    echo "Java installation failed." # Сообщает об ошибке установки

    exit 1 # Завершает скрипт с ошибкой

fi # Завершает проверку установки

echo "Java 21 is ready." # Сообщает, что Java готова
