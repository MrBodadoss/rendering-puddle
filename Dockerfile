FROM alpine:latest

# Install curl dan python3
RUN apk add --no-cache python3 curl

WORKDIR /test-app

# Membuat script start sederhana yang memantau waktu
RUN echo '#!/bin/sh' > start.sh && \
    echo 'echo "=== SERVER UJI COBA RESMI DIMULAI ==="' >> start.sh && \
    echo 'python3 -m http.server 8080 &' >> start.sh && \
    echo 'while true; do echo "Server Berjalan: $(date)"; sleep 60; done' >> start.sh && \
    chmod +x start.sh

# PERBAIKAN: Ubah hak akses folder agar bisa dieksekusi oleh user non-root nanti
RUN chmod -R 777 /test-app

EXPOSE 8080

# SOLUSI FINAL: Buat dan gunakan user non-root sesuai permintaan Checkov (USER 10014)
USER 10014

CMD ["./start.sh"]
