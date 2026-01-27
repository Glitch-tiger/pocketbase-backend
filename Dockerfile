FROM alpine:latest

RUN wget -O /usr/local/bin/pocketbase https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64 \
    && chmod +x /usr/local/bin/pocketbase

WORKDIR /app
VOLUME /app/pb_data

EXPOSE 8080

CMD ["pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/app/pb_data"]