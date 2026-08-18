#!/bin/bash # Запускает скрипт через Bash

JAVA_VERSION="$1" # Получает требуемую версию Java

echo "Checking Java $JAVA_VERSION..." # Сообщает, какую Java проверяем

if java -version 2>&1 | grep -q "\"$JAVA_VERSION\""; then # Проверяет, установлена ли нужная версия Java
    echo "Java $JAVA_VERSION is already installed." # Сообщает, что нужная Java уже есть
else # Выполняется, если нужной Java нет
    echo "Java $JAVA_VERSION is not installed." # Сообщает, что Java отсутствует
    echo "Java installation will be added here." # Временно показывает место для установки Java
fi # Завершает проверку Java
