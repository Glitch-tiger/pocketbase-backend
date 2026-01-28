FROM alpine:latest

# Устанавливаем wget и unzip
RUN apk add --no-cache wget unzip

# Скачиваем и распаковываем PocketBase в текущую директорию
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip \
    && unzip pocketbase_0.22.14_linux_amd64.zip \
    && chmod +x pocketbase \
    && rm pocketbase_0.22.14_linux_amd64.zip

# Копируем базу данных (если есть)
COPY pb_data /pb_data

# Указываем рабочую директорию
WORKDIR /

# Запускаем pocketbase из текущей директории
CMD ./pocketbase serve --http=0.0.0.0:$PORT --dir=/pb_data