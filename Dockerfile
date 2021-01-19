FROM alpine:latest

COPY ./mariadb-backup.sh /etc/periodic/daily/mariadb-backup

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mariadb-client && \
    chmod a+x /etc/periodic/daily/mariadb-backup