FROM alpine:latest

# Устанавливаем зависимости
RUN apk add --no-cache wget unzip

# Скачиваем и распаковываем PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip \
    && unzip pocketbase_0.22.14_linux_amd64.zip \
    && chmod +x /pocketbase \
    && rm pocketbase_0.22.14_linux_amd64.zip

# Копируем наш скачанный файл (если хотим использовать локальный)
COPY pocketbase/pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Или просто используем уже скачанный в /pocketbase
WORKDIR /

EXPOSE 8080

# Используем уже скачанный в корень
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8080"]