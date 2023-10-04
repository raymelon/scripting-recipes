#!/bin/bash
echo "This script creates, deletes, or lists user accounts based on user input"

echo "1. Create User"
echo "2. Delete User"
echo "3. List Users"
read choice

case $choice in
    1)
        echo "Enter username: "
        read username
        adduser $username
        ;;
    2)
        echo "Enter username to delete: "
        read username
        userdel -r $username
        ;;
    3)
        cut -d: -f1 /etc/passwd
        ;;
    *)
        echo "Invalid choice."
        ;;
esac
