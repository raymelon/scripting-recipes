#!/bin/bash

# Generate a random number between 1 and 100
random_number=$(( (RANDOM % 100) + 1 ))

attempts=0
guess=0

echo "Welcome to the Number Guessing Game!"
echo "I'm thinking of a number between 1 and 100."

while [ "$guess" -ne "$random_number" ]; do
    read -p "Your guess: " guess
    ((attempts++))

    if [ "$guess" -lt "$random_number" ]; then
        echo "Try a higher number."
    elif [ "$guess" -gt "$random_number" ]; then
        echo "Try a lower number."
    fi
done

echo "Congratulations! You guessed the number $random_number in $attempts attempts."
