#!/bin/bash

# Directory to organize (default is the current directory)
TARGET_DIR="${1:-.}"

# Function to create a directory if it doesn't exist and move files
organize_files() {
    EXT=$1
    DEST_DIR="$TARGET_DIR/$2"
    mkdir -p "$DEST_DIR"
    
    # Move files matching the extension, excluding the script itself
    find "$TARGET_DIR" -maxdepth 1 -type f -name "*.$EXT" ! -name "$(basename "$0")" -exec mv {} "$DEST_DIR" \;
}

# Organize images
organize_files "jpg" "Images"
organize_files "png" "Images"
organize_files "jpeg" "Images"
organize_files "gif" "Images"

# Organize documents
organize_files "txt" "Documents"
organize_files "pdf" "Documents"
organize_files "doc" "Documents"
organize_files "docx" "Documents"
organize_files "ppt" "Documents"
organize_files "pptx" "Documents"

# Organize videos
organize_files "mp4" "Videos"
organize_files "avi" "Videos"
organize_files "mov" "Videos"
organize_files "mkv" "Videos"

# Organize music
organize_files "mp3" "Music"
organize_files "wav" "Music"

# Organize compressed files
organize_files "zip" "Archives"
organize_files "tar" "Archives"
organize_files "gz" "Archives"
organize_files "rar" "Archives"

# Organize scripts
organize_files "sh" "Scripts"
organize_files "py" "Scripts"
organize_files "js" "Scripts"

echo "Files have been organized."
