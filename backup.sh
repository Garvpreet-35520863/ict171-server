#!/bin/bash

source_path="/var/www/html"
backup_path="/home/ubuntu/backup"
Date=$(date +%Y-%m-%d-%H-%M-%S)

#if backup path doesn't exist

mkdir -p "$backup_path"

#create a archive

tar -czf "$backup_path/website_backup_$Date.tar.gz" "$source_path"

echo "backup successful"
