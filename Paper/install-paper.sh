#!/bin/bash # Запускает скрипт через Bash

MC_VERSION="$1" # Получает версию Minecraft

echo "Installing Paper for Minecraft $MC_VERSION..." # Показывает версию Paper

mkdir -p "minecraft-server" # Создаёт папку для сервера

cd "minecraft-server" || exit 1 # Переходит в папку сервера

echo "Server directory created." # Сообщает, что папка сервера создана
