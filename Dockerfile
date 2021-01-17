FROM alpine:latest

COPY ./mariadb-backup.sh /etc/cron.daily/mariadb-backup

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mariadb-client && \
    chmod a+x /etc/cron.daily/mariadb-backup