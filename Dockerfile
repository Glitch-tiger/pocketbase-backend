FROM alpine:latest

# Устанавливаем зависимости
RUN apk add --no-cache wget unzip

# Скачиваем в текущую директорию
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip \
    && unzip pocketbase_0.22.14_linux_amd64.zip \
    && chmod +x pocketbase \
    && rm pocketbase_0.22.14_linux_amd64.zip

# Проверяем что файл существует и исполняемый
RUN ls -la pocketbase && file pocketbase

# Копируем данные БД
COPY pb_data /pb_data

# Запускаем из текущей директории
CMD ./pocketbase serve --http=0.0.0.0:8080 --dir=/pb_data