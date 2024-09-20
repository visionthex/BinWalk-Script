#!/bin/bash

# Define the path to the directory containing files
directoryPath="/opt/backup_dataset"

# Define the path to the extraction directory in the home directory
extractionDir="$HOME/binwalked_files"

# Create the extraction directory if it does not exist
mkdir -p "$extractionDir"

# Find and process each file
find "$directoryPath" -type f | while read file; do
    echo "Processing $file"

    # Run binwalk to detect offsets and extract files
    sudo binwalk --run-as=root -e -v -C "$extractionDir" "$file"

    # Extract segments using dd for each detected offset
    # List detected offsets
    offsets=$(binwalk -d "$file" | grep '0x' | awk '{print $1}' | tr -d '0x')

    for offset in $offsets; do
        # Convert hex offset to decimal
        decimalOffset=$((16#$offset))

        # Define output file name
        outputFile="$extractionDir/$(basename "$file")_offset_$decimalOffset.bin"

        # Use dd to extract the segment from the file
        dd if="$file" bs=1 skip=$decimalOffset of="$outputFile"

        echo "Extracted segment to $outputFile"
    done

    # Print completion message
    echo "Processing completed for $file"
done
