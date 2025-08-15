#!/bin/bash

# n8n DigitalOcean серверге деплой ету скрипті
# Бұл скриптті серверде іске қосу керек

echo "🚀 n8n DigitalOcean серверге орнатылады..."

# Жүйені жаңарту
echo "📦 Жүйе жаңартылады..."
sudo apt update && sudo apt upgrade -y

# Docker орнату
echo "🐳 Docker орнатылады..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Docker Compose орнату
echo "📋 Docker Compose орнатылады..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# n8n қапшасын жасау
echo "📁 n8n қапшасы жасалынады..."
mkdir -p ~/n8n
cd ~/n8n

# docker-compose.yml файлын жасау
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  n8n:
    image: n8nio/n8n:latest
    container_name: n8n
    restart: unless-stopped
    ports:
      - "80:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=admin123
      - N8N_HOST=0.0.0.0
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - WEBHOOK_URL=http://YOUR_SERVER_IP/
      - GENERIC_TIMEZONE=Asia/Almaty
      - N8N_ENCRYPTION_KEY=your-secret-encryption-key-here
    volumes:
      - n8n_data:/home/node/.n8n
    networks:
      - n8n_network

volumes:
  n8n_data:
    driver: local

networks:
  n8n_network:
    driver: bridge
EOF

# n8n-ді іске қосу
echo "🚀 n8n іске қосылады..."
docker-compose up -d

echo "✅ n8n сәтті орнатылды!"
echo "🌐 n8n-ге кіру: http://YOUR_SERVER_IP"
echo "👤 Пайдаланушы аты: admin"
echo "🔑 Құпия сөз: admin123"
echo ""
echo "📝 Ескерту: YOUR_SERVER_IP-ді нақты сервер IP мекенжайымен ауыстыру керек"
