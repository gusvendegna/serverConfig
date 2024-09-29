#!/bin/bash

# Directory to zip
DIRECTORY="/home/gus/serverConfig/docker"

# Destination directory for zip files
ZIP_DESTINATION="/mnt/bendo4/SHARE/backups/docker-volumes"

# Create destination directory if it doesn't exist
mkdir -p $ZIP_DESTINATION

# Date format for zip file names
DATE_FORMAT="%Y-%m-%d"

# Function to remove old zip files
cleanup_old_files() {
    find $ZIP_DESTINATION -name '*.zip' -type f -mtime +7 -delete
}

# Zip directory function
zip_directory() {
    today=$(date +"$DATE_FORMAT")
    zip_file="$ZIP_DESTINATION/docker-volumes_$today.zip"
    zip -r $zip_file $DIRECTORY
}

# Main script
main() {
    # Zip directory
    zip_directory
    
    # Clean up old zip files
    cleanup_old_files
}

# Execute main function
main
