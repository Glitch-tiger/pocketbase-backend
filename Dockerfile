FROM alpine:latest

RUN apk add --no-cache wget unzip

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip \
    && unzip pocketbase_0.22.14_linux_amd64.zip \
    && chmod +x pocketbase \
    && rm pocketbase_0.22.14_linux_amd64.zip

COPY pb_data /pb_data

# Фиксированный порт 8080 - Railway правильно его пробросит
CMD ./pocketbase serve --http=0.0.0.0:8080 --dir=/pb_data