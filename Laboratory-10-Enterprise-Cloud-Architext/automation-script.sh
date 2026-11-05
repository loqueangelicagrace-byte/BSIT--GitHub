#!/bin/bash

# Cloudnova Automated Backup Script
BACKUP_DIR="/opt/cloudnova/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
CONTAINER_NAME="cloudnova-database"
DB_NAME="nextcloud"
DB_USER="root"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# 1. Backup Database
echo "Starting database backup..."
docker exec -i "$CONTAINER_NAME" mariadb-dump -u"$DB_USER" -p"$MYSQL_ROOT_PASSWORD" "$DB_NAME" > "$BACKUP_DIR/database_$TIMESTAMP.sql"

# 2. Backup Nextcloud Data Volume
echo "Starting Nextcloud volume backup..."
tar -czf "$BACKUP_DIR/nextcloud_$TIMESTAMP.tar.gz" -C /var/lib/docker/volumes/cloudnova_cloud_data _data

echo "Backup completed successfully: $TIMESTAMP"
