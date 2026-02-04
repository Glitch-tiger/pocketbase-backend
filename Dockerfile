FROM ghcr.io/muchobien/pocketbase:latest
CMD ["pocketbase", "serve", "--http=0.0.0.0:8080"]