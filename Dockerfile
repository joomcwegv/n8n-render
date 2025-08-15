FROM n8nio/n8n:latest

# Жұмыс қапшасын орнату
WORKDIR /home/node

# n8n конфигурациясын көшіру
COPY .n8n /home/node/.n8n

# Пайдаланушы құқықтарын орнату
USER node

# n8n-ді іске қосу
CMD ["n8n", "start"]
