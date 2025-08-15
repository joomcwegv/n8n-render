# 🚀 n8n Жылдам Деплой

## 1. Сервер таңдауы

**DigitalOcean** (ең оңай):
- [DigitalOcean](https://www.digitalocean.com/) тіркеліміңізге кіріңіз
- "Create" → "Droplets"
- Ubuntu 22.04 LTS таңдаңыз
- $6/month план (1GB RAM)
- Singapore немесе Frankfurt datacenter

## 2. Серверге қосылу

```bash
ssh root@YOUR_SERVER_IP
```

## 3. Бір командамен орнату

```bash
# Барлығын бір командамен орнату
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/deploy.sh | bash
```

Немесе қадамдық:

```bash
# 1. Жүйені жаңарту
sudo apt update && sudo apt upgrade -y

# 2. Docker орнату
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# 3. Docker Compose орнату
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 4. n8n қапшасын жасау
mkdir -p ~/n8n && cd ~/n8n

# 5. docker-compose.yml жасау
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

# 6. n8n-ді іске қосу
docker-compose up -d
```

## 4. Конфигурацияны өзгерту

```bash
cd ~/n8n
nano docker-compose.yml
```

**Өзгерту керек:**
- `YOUR_SERVER_IP` → нақты сервер IP мекенжайы
- `admin123` → қауіпсіз құпия сөз
- `your-secret-encryption-key-here` → қауіпсіз кілт

## 5. Firewall орнату

```bash
sudo apt install ufw
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw enable
```

## 6. Тестілеу

Браузерде: `http://YOUR_SERVER_IP`

**Кіру деректері:**
- Пайдаланушы аты: `admin`
- Құпия сөз: `admin123`

## ✅ Дайын!

n8n сәтті орнатылды және жұмыс істеп тұр!

## 🛠️ Пайдалану командалары

```bash
# n8n-ді тоқтату
docker-compose down

# n8n-ді іске қосу
docker-compose up -d

# Логтарды көру
docker-compose logs -f n8n

# n8n-ді жаңарту
docker-compose pull
docker-compose up -d
```

## 🔒 Қауіпсіздік

1. Құпия сөзді өзгерту
2. Firewall орнату
3. SSL сертификаты қосу (опционально)
4. Regular backup жасау
