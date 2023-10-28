#!/bin/bash

spinner() {
  local pid=$1
  local delay=0.25
  local spin='-\|/'

  while ps -p $pid > /dev/null; do
    local temp=${spin#?}
    printf " [%c] " "$spin"
    local spin=$temp${spin%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b"
  done

  printf "    \b\b\b\b"
}

# Simulate a time-consuming operation
sleep 5 &

# Start the spinner and capture its PID
spinner $! &

# Wait for the background task to finish
wait

