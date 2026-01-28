FROM alpine:latest

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip \
    && unzip pocketbase_0.22.14_linux_amd64.zip \
    && chmod +x pocketbase \
    && rm pocketbase_0.22.14_linux_amd64.zip

# Копируем ТОЛЬКО данные, без миграций
COPY pb_data /pb_data

# Запускаем без миграций
CMD ./pocketbase serve --http=0.0.0.0:$PORT --dir=/pb_data