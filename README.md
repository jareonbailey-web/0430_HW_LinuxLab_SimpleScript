# Backup & System Report Script

## Description
`backup_and_report.sh` is a shell script that creates a timestamped backup of
the CloudFoundations working directory onto the Desktop, then generates a
brief system report and writes a log file into the backup folder.

## Commands Used & Definitions

| Command | Definition | Why I Used It |
|---|---|---|
| `#!/bin/bash` | Shebang line — tells the OS to use bash to run this script | Required to make the script executable as bash |
| `echo` | Prints text to the terminal | Used for user-friendly status messages |
| `date` | Displays the current system date and time | Timestamps the backup and log entries |
| `pwd` | Prints the current working directory | Confirms where the script is running from |
| `mkdir -p` | Creates a directory (and parent dirs) if they don't exist | Builds the timestamped backup folder safely |
| `cp -r` | Copies files/directories recursively | Duplicates the source folder into the backup |
| `ls -al` | Lists all files with permissions, size, and timestamps | Verifies what was backed up |
| `du -sh` | Shows disk usage of a directory in human-readable form | Confirms the size of the backup |
| `whoami` | Prints the current logged-in username | Documents who ran the backup in the log |
| `uptime` | Shows how long the system has been running | Useful system health info in the report |
| `wc -l` | Counts lines (or items when piped from `ls`) | Tallies the number of backed-up files |
| `cat` | Displays the contents of a file | Prints the log file to confirm it was written |
   