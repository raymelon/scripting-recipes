import os
import shutil

log_directory = '/var/log'
backup_directory = '/var/log/backups'

# Rotate logs
for log_file in os.listdir(log_directory):
    if log_file.endswith('.log'):
        log_path = os.path.join(log_directory, log_file)
        backup_path = os.path.join(backup_directory, log_file)
        shutil.move(log_path, backup_path)
        open(log_path, 'a').close()  # Create a new empty log file

# Add log rotation scheduling in your system's crontab
# Example crontab entry to run this script daily at midnight:
# 0 0 * * * /usr/bin/python3 /path/to/log_rotation_script.py
