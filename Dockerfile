FROM alpine:latest

RUN apk add --no-cache wget unzip

# Скачиваем, распаковываем и перемещаем
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip \
    && unzip pocketbase_0.22.14_linux_amd64.zip \
    && mv pocketbase /usr/local/bin/pocketbase \
    && chmod +x /usr/local/bin/pocketbase \
    && rm pocketbase_0.22.14_linux_amd64.zip

COPY pb_data /pb_data

CMD /usr/local/bin/pocketbase serve --http=0.0.0.0:$PORT --dir=/pb_data