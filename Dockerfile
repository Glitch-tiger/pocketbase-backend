FROM alpine:latest

RUN apk add --no-cache wget unzip

RUN wget -q https://github.com/pocketbase/pocketbase/releases/download/v0.22.17/pocketbase_0.22.17_linux_amd64.zip \
    && unzip pocketbase_0.22.17_linux_amd64.zip \
    && chmod +x /pocketbase \
    && rm pocketbase_0.22.17_linux_amd64.zip

EXPOSE 8080

CMD ["/pocketbase", "serve", "--http=0.0.0.0:8080"]