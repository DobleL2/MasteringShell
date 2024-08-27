#!/bin/bash

# Determine the directory where the script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# File to store tasks in the same directory as the script
TODO_FILE="${SCRIPT_DIR}/todo_list.txt"

# Function to display the to-do list
view_tasks() {
    if [ -f "$TODO_FILE" ]; then
        echo "To-Do List:"
        cat -n "$TODO_FILE"
    else
        echo "No tasks found."
    fi
}

# Function to add a task
add_task() {
    echo "$1" >> "$TODO_FILE"
    echo "Task added: $1"
}

# Function to remove a task
remove_task() {
    if [ -f "$TODO_FILE" ]; then
        # Use sed with double quotes and escape the line number
        if sed -i "" "${1}d" "$TODO_FILE"; then
            echo "Task $1 removed."
        else
            echo "Failed to remove task $1."
        fi
    else
        echo "No tasks to remove."
    fi
}

# Main script logic
case $1 in
    view)
        view_tasks
        ;;
    add)
        shift
        add_task "$*"
        ;;
    remove)
        if [ -z "$2" ]; then
            echo "Please provide the task number to remove."
        else
            remove_task "$2"
        fi
        ;;
    *)
        echo "Usage: $0 {view|add|remove} [task number or task description]"
        ;;
esac
