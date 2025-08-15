# n8n Серверге Деплой Ету Нұсқаулығы

## 🚀 Сервер таңдауы

### DigitalOcean (Ұсынылады)
1. [DigitalOcean](https://www.digitalocean.com/) тіркеліміңізге кіріңіз
2. "Create" → "Droplets" басыңыз
3. Келесі параметрлерді таңдаңыз:
   - **Image**: Ubuntu 22.04 LTS
   - **Size**: Basic → Regular → $6/month (1GB RAM, 1 CPU)
   - **Datacenter**: Singapore немесе Frankfurt (Еуропаға жақын)
   - **Authentication**: SSH Key (қауіпсіздік үшін)

### AWS EC2
1. [AWS Console](https://aws.amazon.com/) кіріңіз
2. EC2 → Launch Instance
3. Amazon Linux 2 немесе Ubuntu Server таңдаңыз
4. t2.micro (free tier) немесе t3.small таңдаңыз

## 📋 Деплой қадамдары

### 1. Серверге қосылу
```bash
ssh root@YOUR_SERVER_IP
```

### 2. Деплой скриптін жүктеу
```bash
# Скриптті жүктеу
wget https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/deploy.sh

# Скриптті іске қосуға дайындау
chmod +x deploy.sh
```

### 3. Скриптті іске қосу
```bash
./deploy.sh
```

### 4. Конфигурацияны өзгерту
```bash
cd ~/n8n
nano docker-compose.yml
```

**Өзгерту керек параметрлер:**
- `WEBHOOK_URL=http://YOUR_SERVER_IP/` - нақты IP мекенжайымен
- `N8N_ENCRYPTION_KEY=your-secret-encryption-key-here` - қауіпсіз кілтпен

### 5. n8n-ді қайта іске қосу
```bash
docker-compose down
docker-compose up -d
```

## 🔧 Қосымша конфигурация

### Firewall орнату
```bash
# UFW орнату
sudo apt install ufw

# SSH портын ашу
sudo ufw allow ssh

# HTTP портын ашу
sudo ufw allow 80

# UFW-ді іске қосу
sudo ufw enable
```

### SSL сертификаты (HTTPS)
```bash
# Certbot орнату
sudo apt install certbot

# SSL сертификатын алу
sudo certbot --nginx -d your-domain.com
```

### Автоматикалық жаңарту
```bash
# Crontab-қа қосу
crontab -e

# Күнделікті жаңарту
0 2 * * * cd ~/n8n && docker-compose pull && docker-compose up -d
```

## 📊 Мониторинг

### Логтарды көру
```bash
# n8n логтарын көру
docker-compose logs -f n8n

# Жүйе ресурстарын көру
htop
```

### Backup жасау
```bash
# Деректерді backup жасау
docker run --rm -v n8n_n8n_data:/data -v $(pwd):/backup alpine tar czf /backup/n8n_backup_$(date +%Y%m%d).tar.gz -C /data .
```

## 🛠️ Пайдалану командалары

```bash
# n8n-ді тоқтату
docker-compose down

# n8n-ді іске қосу
docker-compose up -d

# n8n-ді қайта іске қосу
docker-compose restart

# n8n контейнерін көру
docker ps

# n8n логтарын көру
docker-compose logs n8n
```

## 🔒 Қауіпсіздік кеңестері

1. **Құпия сөзді өзгерту**: `docker-compose.yml` файлында `N8N_BASIC_AUTH_PASSWORD`
2. **Firewall орнату**: Тек қажетті порттарды ашыңыз
3. **SSL сертификаты**: HTTPS қолданыңыз
4. **Regular backup**: Деректерді тұрақты backup жасаңыз
5. **Updates**: n8n-ді тұрақты жаңартыңыз

## 📞 Көмек

Егер мәселе туындаса:
1. `docker-compose logs n8n` командасымен логтарды тексеріңіз
2. [n8n Community](https://community.n8n.io/) форумына жүгіріңіз
3. [n8n Documentation](https://docs.n8n.io/) қараңыз
