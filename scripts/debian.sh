#!/bin/bash # Запускает скрипт через Bash

MC_VERSION="$1" # Получает версию Minecraft, переданную из install.sh

JAVA_VERSION="$2" # Получает требуемую версию Java, переданную из install.sh

echo "Debian detected." # Сообщает, что используется Debian

echo "Minecraft version: $MC_VERSION" # Показывает выбранную версию Minecraft

echo "Required Java version: $JAVA_VERSION" # Показывает требуемую версию Java

echo "Checking Java..." # Сообщает, что начинается проверка Java

if command -v java >/dev/null 2>&1; then # Проверяет, установлена ли Java
    INSTALLED_JAVA=$(java -version 2>&1 | head -n 1 | grep -oP '(?<=version ")[0-9]+') # Получает основную версию установленной Java

    if [ "$INSTALLED_JAVA" = "$JAVA_VERSION" ]; then # Проверяет, совпадает ли установленная Java с требуемой
        echo "Java $JAVA_VERSION is already installed." # Сообщает, что нужная Java уже установлена
    else # Выполняется, если установлена другая версия Java
        echo "Java $INSTALLED_JAVA found, but Java $JAVA_VERSION is required." # Показывает установленную и требуемую версии
        echo "Installing Java $JAVA_VERSION..." # Сообщает о начале установки нужной Java
        sudo apt update # Обновляет список доступных пакетов
        sudo apt install -y "openjdk-${JAVA_VERSION}-jre" # Пытается установить нужную версию Java
    fi # Завершает проверку версии Java
else # Выполняется, если Java вообще отсутствует
    echo "Java is not installed." # Сообщает, что Java отсутствует
    echo "Installing Java $JAVA_VERSION..." # Сообщает о начале установки Java
    sudo apt update # Обновляет список доступных пакетов
    sudo apt install -y "openjdk-${JAVA_VERSION}-jre" # Пытается установить требуемую Java
fi # Завершает проверку Java
