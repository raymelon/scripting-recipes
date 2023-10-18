$sourceDir = "C:\Source"
$backupDir = "C:\Backup"

Copy-Item -Path $sourceDir\* -Destination $backupDir -Recurse
