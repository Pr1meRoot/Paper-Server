#!/bin/bash # Запускает скрипт через Bash

MC_VERSION="$1" # Получает версию Minecraft

JAVA_VERSION="$2" # Получает требуемую версию Java

echo "Debian detected." # Сообщает, что обнаружен Debian

bash java/install-java.sh "$JAVA_VERSION" # Запускает установщик Java

if [ $? -ne 0 ]; then # Проверяет, завершилась ли установка Java успешно

    echo "Java setup failed." # Сообщает об ошибке Java

    exit 1 # Останавливает установку

fi # Завершает проверку Java

echo "Java setup completed." # Сообщает о завершении настройки Java

bash Paper/install-paper.sh "$MC_VERSION" # Запускает установку Paper
