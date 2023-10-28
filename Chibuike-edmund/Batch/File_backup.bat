@echo off
set source_dir=C:\Source
set backup_dir=C:\Backup

robocopy %source_dir% %backup_dir% /E
