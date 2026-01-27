FROM alpine:latest

# Скачиваем PocketBase для Linux
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip \
    && unzip pocketbase_0.22.14_linux_amd64.zip \
    && chmod +x /pocketbase \
    && rm pocketbase_0.22.14_linux_amd64.zip

EXPOSE 8080

CMD ["/pocketbase", "serve", "--http=0.0.0.0:8080"]