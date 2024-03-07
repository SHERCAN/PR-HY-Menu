# Etapa de construcción habilitar cuando se necesita construir
# FROM node:lts-slim AS builder
# WORKDIR /app
# COPY package*.json ./
# RUN pnpm ci
# COPY . .
# RUN pnpm run build

# Etapa de producción
FROM nginx:stable-alpine
# Esta linea se descomenta cuando se necesita copiar la información de la etapa de construccion
# COPY --from=builder /app/dist /usr/share/nginx/html
COPY /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]