#!/bin/bash

#############
#  Colours	#
#############
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
BLUE=$'\033[0;34m'
NC=$'\e[0m'

##################################
# Help function                  #
##################################
Help() {
    echo $GREEN
    echo "Script to remove all branches except the one passed as argument."
    echo
    echo "Syntax: ./remove_branches [-d|b|h|V]"
    echo
    echo "options:"
    echo "-d     Path to the repo directory (required)."
    echo "-b     main/master branch (required)."
    echo "-h     Prints help."
    echo $NC
}

if [ $# -eq 0 ]; then
    Help
    exit
fi

# Get the options
while getopts ":h:d:b:" option; do
    case $option in
    h)
        Help
        exit
        ;;
    d)
        path=${OPTARG}
        ;;
    b)
        b=${OPTARG}
        ;;
    ?)
        echo "Error: Invalid option"
        exit
        ;;
    esac
done

if [ -z "$path" ] || [ -z "$b" ]; then
    echo "$RED The repository path and the main/master branch are required.$NC"
    exit
fi

cd $path

branches_to_remove=($(git branch | cut -c 3- | grep -v $b))
for b in "${branches_to_remove[@]}"; do
    echo $BLUE
    echo "[i] Removing $b ..."
    echo $GREEN
    git branch -D $b
    echo $NC
done
