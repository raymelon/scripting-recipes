#!/bin/bash

current_dir=$HOME  # Set the current directory to the user's home directory initially

while true; do
    echo "Current directory: $current_dir"
    
    inputs=("Navigate to Subdirectory" "Create New Directory" "List Contents" "Return to Previous Directory" "Exit")
    
    select choice in "${inputs[@]}"; do
        case $choice in
            "Navigate to Subdirectory")
                read -p "Enter the subdirectory name: " sub_dir
                new_dir="$current_dir/$sub_dir"
                if [ -d "$new_dir" ]; then
                    current_dir="$new_dir"
                else
                    echo "Subdirectory not found."
                fi
                ;;
            "Create New Directory")
                read -p "Enter the name of the new directory: " new_dir_name
                new_dir="$current_dir/$new_dir_name"
                if [ ! -d "$new_dir" ]; then
                    mkdir "$new_dir"
                    echo "New directory '$new_dir_name' created."
                else
                    echo "Directory '$new_dir_name' already exists."
                fi
                ;;
            "List Contents")
                ls "$current_dir"
                ;;
            "Return to Previous Directory")
                parent_dir=$(dirname "$current_dir")
                if [ "$parent_dir" != "/" ]; then
                    current_dir="$parent_dir"
                else
                    echo "You are already in the root directory."
                fi
                ;;
            "Exit")
                echo "Exiting..............."
                exit 0
                ;;
            *)
                echo "Invalid operation"
                ;;
        esac
    done
done
