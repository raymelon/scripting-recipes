#!/bin/bash

TODO_FILE="$HOME/todo.txt"

touch "$TODO_FILE"

add_task() {
    read -p "Enter a new task: " task
    echo "$task" >> "$TODO_FILE"
    echo "Task added: $task"
}

view_tasks() {
    if [ ! -s "$TODO_FILE" ]; then
        echo "No tasks found."
        return
    fi

    selected_task=$(cat "$TODO_FILE" | fzf --preview "echo {}")

    if [ -n "$selected_task" ]; then
        echo "Selected task: $selected_task"
    else
        echo "No task selected."
    fi
}

remove_task() {
    if [ ! -s "$TODO_FILE" ]; then
        echo "No tasks found."
        return
    fi

    selected_task=$(cat "$TODO_FILE" | fzf --preview "echo {}" --multi)

    if [ -n "$selected_task" ]; then
        sed -i "/$selected_task/d" "$TODO_FILE"
        echo "Removed task(s):"
        echo "$selected_task"
    else
        echo "No task selected."
    fi
}

while true; do
    echo "To-Do List Menu:"
    echo "1. Add a task"
    echo "2. View tasks"
    echo "3. Remove tasks"
    echo "4. Quit"
    read -p "Select an option: " choice

    case $choice in
        1)
            add_task
            ;;
        2)
            view_tasks
            ;;
        3)
            remove_task
            ;;
        4)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
done
