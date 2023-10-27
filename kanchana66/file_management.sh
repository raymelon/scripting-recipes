#!/bin/bash

# Welcome message
echo "Welcome to Simple File Management System"
echo "Hello $USER!"
echo "-------------------------------------"
echo

# Display the current directory
current_dir=$(pwd)
echo "You are currently in: $current_dir Directory"
list=$(ls)
echo "Files and Directories in your Directory:"
echo "$list"
echo "-------------------------------------"
echo "Hello world"

# Selection loop
options=("Delete Directory" "Make Directory" "Rename Directory" "Make File" "Exit")

select choice in "${options[@]}"; do
    case $choice in
        "Delete Directory")
            echo "You selected Delete Directory Option"
            read -t 8 -p "Input the name or path of the directory you want to delete: " name

            if [ -z "$name" ]; then
                echo -e "\nNo input received."
            else
                rm -r "$name"
            fi
            ;;

        "Make Directory")
            echo "You selected Make Directory"
            read -t 8 -p "Input a name for your new directory: " name

            if [ -z "$name" ]; then
                echo -e "\nNo input received."
            else
                mkdir "$name"
            fi
            ;;

        "Rename Directory")
            echo "You selected Rename Directory Option"
            read -t 8 -p "Old Name Of Directory: " old
            read -t 8 -p "New Name Of Directory: " new

            if [ -z "$old" ] || [ -z "$new" ]; then
                echo -e "\nNo old or new name received."
            else
                mv "$old" "$new"
            fi
            ;;

        "Make File")
            echo "You selected Make File Option"
            read -t 8 -p "File Name: " nn
            read -t 8 -p "File Type: " tt

            if [ -z "$nn" ] || [ -z "$tt" ]; then
                echo -e "\nNo file name or file type received."
            else
                touch "$nn.$tt"
            fi
            ;;

        "Exit")
            echo "Thank you for using our simple system"
            break
            ;;

        *)
            echo "Invalid option selected"
            ;;
    esac
done
