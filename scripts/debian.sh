#!/bin/bash # Запускает скрипт через Bash

MC_VERSION="$1" # Получает версию Minecraft

JAVA_VERSION="$2" # Получает версию Java

echo "Debian detected." # Показывает обнаруженный Debian

bash java/install-java.sh "$JAVA_VERSION" # Запускает установку Java 21

echo "Java setup completed." # Сообщает о завершении установки Java

bash scripts/install-paper.sh "$MC_VERSION" # Переходит к установке Paper
