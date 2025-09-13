#!/bin/bash

# --- Variáveis de Configuração (Atualizadas para o usuário 'ubuntu') ---
SERVER_SCREEN_NAME="minecraft"
SERVER_DIR="/home/ubuntu/minecraft"
BACKUP_DIR="/home/ubuntu/minecraft_backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup-$DATE.tar.gz"

# --- Início do Script ---
echo "Iniciando backup do servidor Minecraft..."

# Garante que a pasta de backups exista
mkdir -p $BACKUP_DIR

# Avisa os jogadores no servidor que o backup vai começar
screen -S $SERVER_SCREEN_NAME -p 0 -X stuff "say O servidor sera reiniciado para backup em 1 minuto!$(printf '\r')"

# Espera 60 segundos
sleep 60

# Envia o comando para salvar e parar o servidor
screen -S $SERVER_SCREEN_NAME -p 0 -X stuff "save-all$(printf '\r')"
sleep 5
screen -S $SERVER_SCREEN_NAME -p 0 -X stuff "stop$(printf '\r')"

# Espera até que o servidor seja totalmente finalizado
echo "Aguardando o servidor finalizar..."
while screen -list | grep -q "\.$SERVER_SCREEN_NAME\t"; do
    sleep 1
done
echo "Servidor finalizado."

# Cria o arquivo de backup compactado
echo "Criando o arquivo de backup em $BACKUP_FILE..."
tar -czvf $BACKUP_FILE $SERVER_DIR

# Reinicia o servidor Minecraft em uma nova sessão screen
echo "Reiniciando o servidor Minecraft..."
screen -S $SERVER_SCREEN_NAME -d -m java -Xmx768M -Xms768M -jar $SERVER_DIR/server.jar nogui

echo "Backup concluído e servidor reiniciado com sucesso!"
