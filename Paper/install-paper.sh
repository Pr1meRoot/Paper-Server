#!/bin/bash

MC_VERSION="$1" # Получает версию Minecraft

SERVER_DIR="$HOME/minecraft-server" # Определяет папку Minecraft-сервера

echo "Installing Paper for Minecraft $MC_VERSION..." # Показывает устанавливаемую версию

sudo apt update # Обновляет список пакетов

sudo apt install -y curl jq # Устанавливает инструменты для загрузки Paper и обработки API

mkdir -p "$SERVER_DIR" # Создаёт папку сервера

cd "$SERVER_DIR" || exit 1 # Переходит в папку сервера

PAPER_API="https://fill.papermc.io/v3/projects/paper/versions/$MC_VERSION/builds" # Формирует адрес Paper API

echo "Finding latest stable Paper build..." # Сообщает о поиске стабильной сборки

PAPER_URL=$(curl -fsSL "$PAPER_API" | jq -r 'first(.[] | select(.channel == "STABLE") | .downloads."server:default".url) // empty') # Получает ссылку на последнюю стабильную сборку

if [ -z "$PAPER_URL" ]; then # Проверяет, была ли найдена сборка

    echo "Paper build not found." # Сообщает об ошибке поиска

    exit 1 # Завершает установщик

fi # Завершает проверку сборки

echo "Downloading Paper..." # Сообщает о начале скачивания

curl -fL "$PAPER_URL" -o paper.jar # Скачивает Paper и сохраняет его как paper.jar

if [ ! -s paper.jar ]; then # Проверяет, существует ли скачанный файл

    echo "Paper download failed." # Сообщает об ошибке скачивания

    exit 1 # Завершает установщик

fi # Завершает проверку файла

echo "Paper downloaded successfully." # Сообщает об успешном скачивании

echo "" # Добавляет пустую строку

echo "Do you accept the Minecraft EULA? [y/N]" # Спрашивает пользователя о принятии EULA

read -r EULA # Получает ответ пользователя

if [[ "$EULA" =~ ^[Yy]$ ]]; then # Проверяет, согласился ли пользователь

    echo "eula=true" > eula.txt # Создаёт файл с принятием EULA

else # Выполняется, если пользователь не согласился

    echo "EULA was not accepted." # Сообщает, что соглашение не принято

    exit 0 # Завершает установку без запуска сервера

fi # Завершает проверку EULA

echo "Starting Paper server..." # Сообщает о запуске сервера

java -Xms2G -Xmx2G -jar paper.jar --nogui # Запускает Paper с выделением до 2 ГБ оперативной памяти
