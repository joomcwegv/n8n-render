# n8n Render.com Деплой

Бұл жоба n8n-ді [Render.com](https://render.com/) платформасына деплой ету үшін құрылған.

## 🚀 Жылдам бастау

### 1. Repository клонидау
```bash
git clone https://github.com/joomcwegv/n8n-render.git
cd n8n-render
```

### 2. Render-де деплой

1. [Render.com](https://render.com/) сайтына өтіңіз
2. "Get Started for Free" басыңыз
3. GitHub тіркеліміңізбен кіріңіз
4. "New +" → "Blueprint" таңдаңыз
5. `joomcwegv/n8n-render` repository-ні қосыңыз
6. `render.yaml` файлын таңдаңыз
7. "Create Blueprint" басыңыз

### 3. Конфигурация

Render Dashboard-та Environment Variables өзгерту:

```
N8N_BASIC_AUTH_USER = admin
N8N_BASIC_AUTH_PASSWORD = your-secure-password
N8N_ENCRYPTION_KEY = your-secure-encryption-key
```

### 4. Дайын! 🎉

2-3 минуттан кейін n8n дайын болады:
- URL: `https://your-app.onrender.com`
- Пайдаланушы аты: `admin`
- Құпия сөз: сіз орнатқан құпия сөз

## 📁 Файлдар

- `render.yaml` - Render Blueprint конфигурациясы
- `render-simple.yaml` - Қарапайым конфигурация
- `Dockerfile` - Docker конфигурациясы
- `QUICK_RENDER_DEPLOY.md` - Жылдам деплой нұсқаулығы
- `RENDER_DEPLOYMENT.md` - Толық нұсқаулық

## ✨ Render артықшылықтары

- 🆓 **Тегін план**: Айына 750 сағат
- 🔒 **Автоматикалық SSL**: HTTPS сертификаттары
- 🚀 **Автоматикалық деплой**: Git-ке қосқаннан кейін
- 📊 **Мониторинг**: Логтар және метрикалар
- 🔄 **Автоскейлинг**: Жүктемеге байланысты
- 🌍 **CDN**: Жылдам жеткізу

## 💰 Бағасы

- **Тегін план**: $0/ай (750 сағат)
- **Starter**: $7/ай (1000 сағат)
- **Pro**: $25/ай (2000 сағат)

## 🔧 Пайдалану

### Логтарды көру
1. Render Dashboard → Your App → Logs
2. Real-time логтарды көруге болады

### Сервисті қайта іске қосу
1. Render Dashboard → Your App → Manual Deploy
2. "Deploy latest commit" басыңыз

### Environment Variables өзгерту
1. Render Dashboard → Your App → Environment
2. Өзгерту керек параметрлерді өзгерту
3. "Save Changes" басыңыз

## 🔒 Қауіпсіздік

1. **Құпия сөзді өзгерту**: Environment Variables-та
2. **SSL сертификаты**: Автоматикалық
3. **Firewall**: Render арқылы қорғаныс
4. **Backup**: Regular backup жасау

## 📞 Көмек

- [Render Documentation](https://render.com/docs)
- [n8n Documentation](https://docs.n8n.io/)
- [n8n Community](https://community.n8n.io/)

## 📄 Лицензия

MIT License

---

**Repository**: [https://github.com/joomcwegv/n8n-render](https://github.com/joomcwegv/n8n-render)  
**Render - бұл n8n-ді деплой етуге ең оңай жол!** 🚀

