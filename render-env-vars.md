# 🔧 Render Environment Variables

## 📋 n8n Render-де орнату керек Environment Variables

### 1️⃣ Негізгі Environment Variables

```bash
# Пайдаланушы аты
N8N_BASIC_AUTH_USER = admin

# Құпия сөз (қауіпсіз болуы керек)
N8N_BASIC_AUTH_PASSWORD = MySecurePassword123!

# Шифрлау кілті (қауіпсіз болуы керек)
N8N_ENCRYPTION_KEY = my-secret-encryption-key-2025-xyz
```

### 2️⃣ Қосымша Environment Variables

```bash
# Негізгі аутентификация
N8N_BASIC_AUTH_ACTIVE = true

# Хост
N8N_HOST = 0.0.0.0

# Порт
N8N_PORT = 5678

# Протокол
N8N_PROTOCOL = https

# Уақыт белдеуі
GENERIC_TIMEZONE = Asia/Almaty

# Лог деңгейі
N8N_LOG_LEVEL = info

# Диагностика
N8N_DIAGNOSTICS_ENABLED = false

# Максималды payload өлшемі
N8N_PAYLOAD_SIZE_MAX = 16
```

### 3️⃣ Қауіпсіз құпия сөз мысалдары

```bash
# Мысал 1
N8N_BASIC_AUTH_PASSWORD = n8nSecure2025!@#

# Мысал 2
N8N_BASIC_AUTH_PASSWORD = MyN8nPassword123$

# Мысал 3
N8N_BASIC_AUTH_PASSWORD = RenderN8n2025!@#$%
```

### 4️⃣ Қауіпсіз кілт мысалдары

```bash
# Мысал 1
N8N_ENCRYPTION_KEY = my-secret-encryption-key-2025-xyz-123

# Мысал 2
N8N_ENCRYPTION_KEY = n8n-render-secure-key-2025-abc-def

# Мысал 3
N8N_ENCRYPTION_KEY = my-n8n-encryption-key-2025-xyz-789
```

## 🚀 Render-де орнату қадамдары

### 1. Render Dashboard-қа өту
1. [Render.com](https://render.com/) сайтына өтіңіз
2. Тіркеліміңізге кіріңіз
3. n8n сервисіңізді таңдаңыз

### 2. Environment бөліміне өту
1. Сервис бетінде **"Environment"** табын басыңыз
2. **"Environment Variables"** бөлімін табыңыз

### 3. Environment Variables қосу
1. **"Add Environment Variable"** басыңыз
2. Келесі ақпаратты енгізіңіз:

```
Key: N8N_BASIC_AUTH_USER
Value: admin
```

```
Key: N8N_BASIC_AUTH_PASSWORD
Value: MySecurePassword123!
```

```
Key: N8N_ENCRYPTION_KEY
Value: my-secret-encryption-key-2025-xyz
```

### 4. Өзгерістерді сақтау
1. **"Save Changes"** басыңыз
2. Render автоматты түрде сервисті қайта іске қосады

## ⚠️ Маңызды ескертулер

### 🔒 Қауіпсіздік талаптары:
- **Құпия сөз**: Кемінде 12 символ, үлкен әріп, кіші әріп, сан, арнайы символ
- **Кілт**: Кемінде 32 символ, әртүрлі символдар
- **Ешқашан** құпия деректерді кодта сақтамаңыз

### 📝 Құпия сөз мысалы:
```
MySecureN8nPassword2025!@#
```

### 🔑 Кілт мысалы:
```
my-secret-encryption-key-2025-xyz-123-abc-def
```

## 🔄 Сервисті қайта іске қосу

Environment Variables өзгергеннен кейін:

1. **"Manual Deploy"** бөліміне өтіңіз
2. **"Deploy latest commit"** басыңіз
3. 2-3 минут күтесіз

## ✅ Тексеру

Деплой аяқталғаннан кейін:

1. **URL-ге өтіңіз**: `https://your-app.onrender.com`
2. **Кіру деректері**:
   - Пайдаланушы аты: `admin`
   - Құпия сөз: сіз орнатқан құпия сөз

## 🆘 Көмек

Егер мәселе туындаса:

1. **Render Logs** көру
2. Environment Variables дұрыс орнатылғанын тексеру
3. Құпия сөз мен кілтті қайта тексеру

---

**Repository**: [https://github.com/joomcwegv/n8n-render](https://github.com/joomcwegv/n8n-render)
