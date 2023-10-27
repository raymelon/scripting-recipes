#!/bin/bash

#addition
add() {
    result=$(echo "$1 + $2" | bc)
    echo "Result: $result"
}

#subtraction
subtract() {
    result=$(echo "$1 - $2" | bc)
    echo "Result: $result"
}

#multiplication
multiply() {
    result=$(echo "$1 * $2" | bc)
    echo "Result: $result"
}

#division
divide() {
    if [ "$2" -eq 0 ]; then
        echo "Error: Division by zero is not allowed."
    else
        result=$(echo "scale=2; $1 / $2" | bc)
        echo "Result: $result"
    fi
}

#loop
while true; do
    echo "Simple Calculator"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Exit"

    read -p "Enter your choice (1/2/3/4/5): " choice

    if [ "$choice" -eq 5 ]; then
        echo "Exiting..."
        break
    elif [ "$choice" -ge 1 ] && [ "$choice" -le 4 ]; then
        read -p "Enter the first number: " num1
        read -p "Enter the second number: " num2

        case "$choice" in
            1)
                add "$num1" "$num2"
                ;;
            2)
                subtract "$num1" "$num2"
                ;;
            3)
                multiply "$num1" "$num2"
                ;;
            4)
                divide "$num1" "$num2"
                ;;
        esac
    else
        echo "Invalid choice. Please select a valid option."
    fi
done
