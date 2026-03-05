# ===== Stage 1: Builder =====
FROM node:18-alpine AS builder

WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app/ .

# ===== Stage 2: Production =====
FROM builder

WORKDIR /app

EXPOSE 3000
CMD ["npm", "start"]
