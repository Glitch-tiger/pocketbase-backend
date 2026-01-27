FROM alpine:latest

# Устанавливаем PocketBase из ZIP
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip \
    && unzip pocketbase_0.22.14_linux_amd64.zip \
    && mv pocketbase /usr/local/bin/pocketbase \
    && chmod +x /usr/local/bin/pocketbase \
    && rm pocketbase_0.22.14_linux_amd64.zip

# Копируем существующую БД
COPY pb_data /app/pb_data
COPY pb_migrations /app/pb_migrations

WORKDIR /app

# Запускаем
CMD /usr/local/bin/pocketbase serve \
    --http=0.0.0.0:$PORT \
    --dir=/app/pb_data