#!/bin/bash

# ============================================
# backup_and_report.sh
# Creates a timestamped backup of a directory,
# generates a system report, and logs results.
# ============================================

echo "=========================================="
echo "   Backup & System Report Script"
echo "=========================================="

# 1. Print current date and time
date

# 2. Print the current working directory
pwd

# 3. Create a backup directory with a timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR=~/Desktop/backup_$TIMESTAMP
mkdir -p "$BACKUP_DIR"
echo "Backup directory created: $BACKUP_DIR"

# 4. Copy Documents folder contents into backup (one level deep)
cp -r ~/Documents/TheoWAF/CloudFoundations/. "$BACKUP_DIR"
echo "Files copied to backup directory."

# 5. List the backed-up files
echo "--- Backed up files ---"
ls -al "$BACKUP_DIR"

# 6. Show disk usage of the backup
du -sh "$BACKUP_DIR"

# 7. Display the current logged-in user
whoami

# 8. Show system uptime
uptime

# 9. Count files in the backup directory
FILE_COUNT=$(ls "$BACKUP_DIR" | wc -l)
echo "Total files/folders in backup: $FILE_COUNT"

# 10. Create a log file inside the backup directory
LOG_FILE="$BACKUP_DIR/backup_log.txt"
echo "Backup completed on: $(date)" > "$LOG_FILE"
echo "Backed up by: $(whoami)" >> "$LOG_FILE"
echo "Source: ~/Documents/TheoWAF/CloudFoundations/" >> "$LOG_FILE"
echo "Log file created at: $LOG_FILE"

# 11. Display the contents of the log file
cat "$LOG_FILE"

# 12. Print a closing message
echo "=========================================="
echo "   Backup Complete! Have a great day."
echo "=========================================="

