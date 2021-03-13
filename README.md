# mariadb-backup
Simple docker image to automate and rotate backups for a mysql/mariadb instance

Refer to [docker-compose.example.yml] for example usage

Derived from https://github.com/ricardolsmendes/docker-samples

## Environment Variables

```MYSQL_HOST: db``` - this should match the container name or hostname of the database

```FILE_PREFIX: app_name_here``` - prefix the backup file name

```ADD_DATE: 1``` - appends the date/time to the file name if set

```RETAIN_NO: 7``` - removes more than X backups (defaults to 1)

## Manual Usage

Backups will be run daily using cron, to trigger a manual backup:

```docker exec mariadb-backup /etc/periodic/daily/mariadb-backup```

or

```docker-compose exec mariadb-backup /etc/periodic/daily/mariadb-backup```
