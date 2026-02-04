FROM alpine:latest

RUN apk add --no-cache \
    wget \
    unzip

# Скачиваем PocketBase
ARG PB_VERSION=0.22.17
RUN wget -q https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pocketbase_${PB_VERSION}_linux_amd64.zip \
    && chmod +x /pocketbase \
    && rm pocketbase_${PB_VERSION}_linux_amd64.zip

# Создаём папку для данных
RUN mkdir -p /pb_data

# Копируем возможные исходные данные
COPY pb_data /pb_data

# Открываем порт
EXPOSE 8080

# Запускаем PocketBase с правильным IP
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb_data"]