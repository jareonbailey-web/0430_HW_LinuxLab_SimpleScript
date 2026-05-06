#!/bin/bash

# ============================================
# File Organizer Script
# Sorts files from a source dir into categories
# ============================================

echo "=========================================="
echo " Welcome to the File Organizer Script "
echo "=========================================="
echo ""

# Step 1: Print an inspiring poem before we get to work
echo "--- A Word From Horatius ---"
echo ""
echo "Then out spake brave Horatius,"
echo "the Captain of the Gate:"
echo "\"To every man upon this earth\""
echo "\"Death cometh soon or late.\""
echo "\"And how can man die better\""
echo "\"than facing fearful odds,\""
echo "\"For the ashes of his fathers,\""
echo "\"And the temples of his Gods...\""
echo ""
echo "----------------------------"
echo ""

# Step 2: Define source and destination
SOURCE_DIR="$HOME/Downloads"
DEST_DIR="$HOME/Organized_Files"

echo "Source directory: $SOURCE_DIR"
echo "Destination directory: $DEST_DIR"
echo ""

# Step 3: Create organized subdirectories
echo "Creating destination folders..."
mkdir -p "$DEST_DIR/Images"
mkdir -p "$DEST_DIR/Documents"
mkdir -p "$DEST_DIR/Videos"
mkdir -p "$DEST_DIR/Archives"
mkdir -p "$DEST_DIR/Other"

# Step 4: Copy image files
echo "Copying image files..."
cp "$SOURCE_DIR"/*.jpg "$DEST_DIR/Images/" 2>/dev/null
cp "$SOURCE_DIR"/*.png "$DEST_DIR/Images/" 2>/dev/null

# Step 5: Copy document files
echo "Copying document files..."
cp "$SOURCE_DIR"/*.pdf "$DEST_DIR/Documents/" 2>/dev/null
cp "$SOURCE_DIR"/*.txt "$DEST_DIR/Documents/" 2>/dev/null

# Step 6: Copy video files
echo "Copying video files..."
cp "$SOURCE_DIR"/*.mp4 "$DEST_DIR/Videos/" 2>/dev/null

# Step 7: Copy archive files
echo "Copying archive files..."
cp "$SOURCE_DIR"/*.zip "$DEST_DIR/Archives/" 2>/dev/null

# Step 8: List what was organized
echo ""
echo "--- Organization Summary ---"
ls "$DEST_DIR"

# Step 9: Count total files copied
FILE_COUNT=$(find "$DEST_DIR" -type f | wc -l)
echo ""
echo "Total files organized: $FILE_COUNT"

# Step 10: Show disk usage of new folder
echo ""
echo "Disk usage of Organized_Files:"
du -sh "$DEST_DIR"

# Step 11: Log the event with a timestamp
echo ""
echo "Logging activity..."
date >> "$DEST_DIR/organizer_log.txt"
echo "Files organized: $FILE_COUNT" >> "$DEST_DIR/organizer_log.txt"

# Step 12: Display the log
echo ""
echo "--- Activity Log ---"
cat "$DEST_DIR/organizer_log.txt"

# Step 13: Done!
echo ""
echo "Organization complete! Your files are in: $DEST_DIR"
echo "=========================================="




