FROM alpine:latest

# Install curl untuk cek jaringan dan python3 untuk web server internal
RUN apk add --no-cache python3 curl

WORKDIR /test-app

# Membuat script start sederhana yang memantau waktu
RUN echo '#!/bin/sh' > start.sh && \
    echo 'echo "=== SERVER UJI COBA RESMI DIMULAI ==="' >> start.sh && \
    echo 'python3 -m http.server 8080 &' >> start.sh && \
    echo 'while true; do echo "Server Berjalan: $(date)"; sleep 60; done' >> start.sh && \
    chmod +x start.sh

EXPOSE 8080

CMD ["./start.sh"]
