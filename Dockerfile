# n8n үшін негізгі Docker образы.
# ':latest' орнына нақты версияны көрсету продакшн үшін тұрақтылықты қамтамасыз етеді.
FROM n8nio/n8n:1.44.1

# Қосымша пакеттерді орнату үшін root қолданушысына ауысу
USER root

# ImageMagick-ке балама, жеңіл және жылдам кітапхана
RUN apk add --update graphicsmagick

# Қауіпсіздік үшін қайтадан node қолданушысына ауысу
USER node

# Сервистің жағдайын тексеруге арналған нүкте
HEALTHCHECK --interval=30s --timeout=10s --start-period=1m --retries=3 \
  CMD wget -q --spider http://localhost:5678/healthz || exit 1