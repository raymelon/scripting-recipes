#!/bin/bash


sentence="Simple animation."


for ((i = 0; i < ${#sentence}; i++)); do
    echo -n "${sentence:i:1}"   
    sleep 0.1                  
done


echo
