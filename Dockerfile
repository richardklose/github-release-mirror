FROM debian:stretch-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        cron \
        curl \
        jq \
        wget \
        nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY crontab.example /etc/cron.d/mirror-cron
COPY mirror.sh       /opt/mirror.sh
COPY entry.sh        /opt/entry.sh
COPY mirror.conf     /etc/nginx/sites-enabled/default

ENV MIRROR_DIR="/mirror"

RUN chmod +x /opt/mirror.sh
RUN chmod +x /opt/entry.sh

EXPOSE 80

VOLUME ["/mirror"]

ENTRYPOINT ["/opt/entry.sh"]
