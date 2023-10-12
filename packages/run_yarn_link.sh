#!/bin/bash

# Get the path of the folder where you want to run the command
# If you want to specify a folder, replace '.' with the folder path
folder_path="."

# Loop through each directory in the specified folder
for dir in $(find $folder_path -maxdepth 1 -type d); do
  # Skip the parent folder itself
  if [ "$dir" != "$folder_path" ]; then
    echo "Running command in $dir"
    # Change to the directory
    cd "$dir"
    # Run the command with the environment variable
    YARN_IGNORE_PATH=1 yarn link
    # Change back to the original directory (optional)
    cd -
  fi
done
