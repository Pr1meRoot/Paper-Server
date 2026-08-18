#!/bin/bash # Запускает скрипт через Bash

echo "Debian detected." # Сообщает, что выбран установщик для Debian

echo "Checking Java..." # Сообщает пользователю, что начинается проверка Java

if command -v java >/dev/null 2>&1; then # Проверяет, установлена ли команда Java в системе
    echo "Java is installed." # Сообщает, что Java найдена
else # Выполняется, если Java не найдена
    echo "Java is not installed." # Сообщает, что Java отсутствует
fi # Завершает проверку наличия Java
