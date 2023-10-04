#!/bin/bash
source_dir="/path/to/source_directory"
backup_dir="/path/to/backup_directory"
timestamp=$(date +"%Y%m%d%H%M%S")

tar -czf "$backup_dir/backup_$timestamp.tar.gz" "$source_dir"
echo "Backup completed."
