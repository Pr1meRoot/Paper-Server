#!/bin/bash

source /etc/os-release # Загружает информацию о Linux-дистрибутиве

MC_VERSION="1.21.1" # Устанавливает фиксированную версию Minecraft
JAVA_VERSION="21" # Устанавливает требуемую версию Java

echo "Minecraft: $MC_VERSION" # Показывает версию Minecraft
echo "Required Java: $JAVA_VERSION" # Показывает требуемую версию Java

case "$ID" in # Проверяет дистрибутив Linux
    debian) # Если используется Debian
        bash scripts/debian.sh "$MC_VERSION" "$JAVA_VERSION" # Запускает установщик Debian
        ;; # Завершает вариант Debian

    ubuntu) # Если используется Ubuntu
        bash scripts/ubuntu.sh "$MC_VERSION" "$JAVA_VERSION" # Запускает установщик Ubuntu
        ;; # Завершает вариант Ubuntu

    *) # Если дистрибутив не поддерживается
        echo "Unsupported distribution: $ID" # Показывает неподдерживаемый дистрибутив
        exit 1 # Завершает скрипт с ошибкой
        ;; # Завершает вариант ошибки
esac # Завершает проверку дистрибутива
