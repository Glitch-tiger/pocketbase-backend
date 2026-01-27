FROM alpine:latest

# Устанавливаем PocketBase
RUN wget -O /usr/local/bin/pocketbase \
    https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64 \
    && chmod +x /usr/local/bin/pocketbase

# Копируем существующую БД и миграции
COPY pb_data /app/pb_data
COPY pb_migrations /app/pb_migrations

WORKDIR /app

CMD /usr/local/bin/pocketbase serve \
    --http=0.0.0.0:$PORT \
    --dir=/app/pb_data \
    --migrationsDir=/app/pb_migrations