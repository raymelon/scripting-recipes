#!/bin/bash
process_name="your_process_name"

if pgrep -x "$process_name" > /dev/null
then
    echo "$process_name is running"
else
    echo "$process_name is not running"
fi
