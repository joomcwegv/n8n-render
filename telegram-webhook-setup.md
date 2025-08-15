# Telegram Webhook Орнату нұсқаулығы

## Мәселе
Telegram webhook үшін HTTPS URL қажет, бірақ локальды n8n HTTP пайдаланады.

## Шешімдер

### 1. Telegram Test Bot қолдану
Telegram-да test bot қолдану арқылы webhook-ті орнатуға болады:

1. n8n-де Telegram нодын қосыңыз
2. "Test Bot" опциясын таңдаңыз
3. Bot Token-ді енгізіңіз
4. Webhook URL-ді келесі форматта енгізіңыз:
   ```
   https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook?url=http://localhost:5679/webhook/telegram
   ```

### 2. ngrok пайдалану (аутентификация керек)
1. https://dashboard.ngrok.com/signup сайтына өтіп тіркеліңіз
2. Authtoken алыңыз
3. Терминалда: `ngrok config add-authtoken <YOUR_TOKEN>`
4. Содан кейін: `ngrok http 5679`
5. HTTPS URL-ді алып, Telegram webhook-ке қолданыңыз

### 3. Cloudflare Tunnel пайдалану
1. Cloudflare тіркеліңіз
2. cloudflared орнатыңыз
3. Туннель жасаңыз

### 4. Локальды Telegram Bot қолдану
Telegram Bot API-нің локальды нұсқасын қолдануға болады.

## Қадамдар

1. **n8n-ге кіру:** http://localhost:5679
2. **Жаңа workflow жасау**
3. **Telegram нодын қосу**
4. **Test Bot режимін таңдау**
5. **Webhook URL-ді дұрыс форматта енгізу**

## Көмек
- Telegram Bot API құжаттамасы: https://core.telegram.org/bots/api
- n8n Telegram ноды: https://docs.n8n.io/integrations/builtin/trigger-nodes/n8n-nodes-base.telegramtrigger/

