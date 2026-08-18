#!/bin/bash # Запускает скрипт через Bash

MC_VERSION="$1" # Получает версию Minecraft из install.sh

SERVER_DIR="$HOME/minecraft-server" # Определяет папку, в которой будет находиться сервер

PAPER_API="https://api.papermc.io/v2/projects/paper" # Указывает официальный API PaperMC

echo "Installing Paper $MC_VERSION..." # Показывает, какую версию Paper устанавливаем

mkdir -p "$SERVER_DIR" # Создаёт папку сервера, если её ещё нет

cd "$SERVER_DIR" || exit 1 # Переходит в папку сервера и завершает работу при ошибке

BUILD=$(curl -s "$PAPER_API/versions/$MC_VERSION/builds" | grep -o '"build":[0-9]*' | tail -n 1 | grep -o '[0-9]*') # Получает последний доступный build Paper

if [ -z "$BUILD" ]; then # Проверяет, удалось ли получить build
    echo "Error: Paper build for Minecraft $MC_VERSION was not found." # Показывает ошибку
    exit 1 # Завершает установщик
fi # Завершает проверку build

echo "Latest Paper build: $BUILD" # Показывает найденный build

JAR_NAME="paper-$MC_VERSION-$BUILD.jar" # Формирует имя файла Paper

DOWNLOAD_URL="$PAPER_API/downloads/$MC_VERSION/$BUILD/$JAR_NAME" # Формирует ссылку на скачивание Paper

echo "Downloading Paper..." # Сообщает о начале скачивания

curl -L "$DOWNLOAD_URL" -o paper.jar # Скачивает Paper и сохраняет его как paper.jar

if [ ! -f "paper.jar" ]; then # Проверяет, появился ли скачанный файл
    echo "Error: Paper download failed." # Показывает ошибку скачивания
    exit 1 # Завершает установщик
fi # Завершает проверку файла

echo "Paper downloaded successfully." # Сообщает об успешном скачивании

echo "eula=true" > eula.txt # Создаёт EULA-файл и автоматически принимает соглашение Minecraft

echo "EULA accepted." # Сообщает, что EULA создана

echo "Paper installation completed." # Сообщает о завершении установки Paper
