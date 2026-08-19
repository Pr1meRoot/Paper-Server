# Paper (Minecraft) Server — автоматический установщик

Автоматическая установка и базовая настройка сервера Paper (Minecraft) версии 1.21.1 для Debian и Ubuntu.

Проект автоматически определяет дистрибутив Linux, при необходимости устанавливает Java 21, скачивает Paper 1.21.1, создаёт каталог сервера и запускает сервер. Рекомендуется использовать в тестовой среде и внимательно читать разделы безопасности перед использованием в продакшене.

## Features

- Automatic Debian and Ubuntu detection
- Automatic Java 21 installation
- Automatic Paper 1.21.1 download
- Automatic server directory creation
- Minecraft EULA confirmation (can be automated with a flag)
- Automatic server startup (recommended to convert to systemd unit)

## Requirements

- Debian or Ubuntu
- Internet connection
- sudo privileges (only for package installation)
- amd64 system
- At least 2 GB of available RAM

## Supported versions

| Component | Version |
|---|---|
| Minecraft | 1.21.1 |
| Paper | 1.21.1 |
| Java | 21 |
| Debian | Supported |
| Ubuntu | Supported |
