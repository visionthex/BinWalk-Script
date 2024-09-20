# Binwalk Extraction Script
This Bash script automates the process of detecting and extracting file segments using binwalk from files stored in a specified directory. It extracts files to a user-defined directory, using dd to extract data based on detected offsets.

## How It Works
1. Directory Paths:
    - directoryPath: The path to the directory containing the files to process (e.g., `/opt/backup_dataset`).
    - extractionDir: The directory where extracted files are saved (`$HOME/binwalked_files` by default).
2. File Processing:
    - The script finds all files in the specified directory and processes each file using binwalk to detect data offsets.
    - It extracts the segments using dd based on the detected offsets, saving the extracted segments in the output directory.
3. Steps in the Script:
    - Creates the extraction directory if it doesn't exist.
    - Uses binwalk with sudo privileges to extract data.
    - Uses dd to extract specific segments based on hexadecimal offsets detected by binwalk.

## Prerequisites
**binwalk:** Install using `sudo apt-get install binwalk` or your preferred package manager.
**sudo permissions:** The script requires root access for running binwalk (`--run-as=root`).

## How to Run the Script
1. Clone or download the script to your machine.
2. Make the script executable:

```bash
chmod +x your-script-name.sh
```

3. Run the script:

```bash
./your-script-name.sh
```

4. The script will process all files in the specified directory and save the extracted segments to the designated extraction directory.

## Customization
  - Modify directoryPath to point to the directory where your target files are located.
  - Change extractionDir to your preferred extraction path.
