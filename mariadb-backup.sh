#!/bin/sh

BACKUP_FOLDER=/backup
NOW=$(date +%Y%m%dT%H%M%S)

GZIP=$(which gzip)
MYSQLDUMP=$(which mysqldump)

[ ! -d "$BACKUP_FOLDER" ] && mkdir --parents $BACKUP_FOLDER

[ -z "$FILE_PREFIX" ] && FILE_PREFIX="backup"

[ -z "$RETAIN_NO" ] && RETAIN_NO=1

[ -z "$ADD_DATE" ] && FILE_SUFFIX="" || FILE_SUFFIX="_${NOW}"

FILE=${BACKUP_FOLDER}/${FILE_PREFIX}${FILE_SUFFIX}.sql.gz

$MYSQLDUMP -h $MYSQL_HOST -u root -p${MYSQL_ROOT_PASSWORD} --databases $MYSQL_DATABASE | $GZIP -9 > $FILE

find $BACKUP_FOLDER -name "*$FILE_PREFIX*" | sort -r | tail -n +$(($RETAIN_NO + 1)) | xargs rm