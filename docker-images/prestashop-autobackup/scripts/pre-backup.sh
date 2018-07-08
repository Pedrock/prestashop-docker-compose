#!/bin/bash

rm -rf /data/db/
xtrabackup --backup \
           --host=$MYSQL_HOST \
           --user=$MYSQL_USER \
           --password=$MYSQL_PASSWORD \
           --target-dir=/data/db/