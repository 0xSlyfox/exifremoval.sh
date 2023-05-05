#!/bin/bash

# Check if the user provided a directory
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Set the target directory
TARGET_DIR="$1"

# Ensure exiftool is installed
if ! command -v exiftool >/dev/null 2>&1; then
    echo "Error: exiftool is not installed. Please install exiftool before running this script."
    exit 2
fi

# Find all JPEG and PNG images in the target directory and its subdirectories
# Then run exiftool to remove metadata
find "$TARGET_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec exiftool -all= {} \;

# Inform the user that the process is complete
echo "Metadata removal complete."

exit 0
