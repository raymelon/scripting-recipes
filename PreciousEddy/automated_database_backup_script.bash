#!/bin/bash
echo "This Script automates the Backup of a MySQL database and compresses it"

db_user="username"
db_password="password"
db_name="database_name"
backup_dir="/path/to/backup_directory"
timestamp=$(date +"%Y%m%d%H%M%S")

mysqldump -u$db_user -p$db_password $db_name | gzip > "$backup_dir/backup_$timestamp.sql.gz"
echo "Database backup completed."
