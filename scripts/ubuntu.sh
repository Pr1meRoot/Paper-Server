#!/bin/bash # Запускает скрипт через Bash

MC_VERSION="$1" # Получает версию Minecraft

JAVA_VERSION="$2" # Получает требуемую версию Java

echo "Ubuntu detected." # Показывает обнаруженный дистрибутив

echo "Minecraft version: $MC_VERSION" # Показывает выбранную версию Minecraft

echo "Required Java: $JAVA_VERSION" # Показывает требуемую версию Java

bash java/install-java.sh "$JAVA_VERSION" # Передаёт установку Java отдельному скрипту

echo "Java setup completed." # Сообщает, что этап Java завершён

echo "Starting Paper installation..." # Переходит к следующему этапу

bash scripts/install-paper.sh "$MC_VERSION" # Запускает установку Paper и передаёт версию Minecraft
