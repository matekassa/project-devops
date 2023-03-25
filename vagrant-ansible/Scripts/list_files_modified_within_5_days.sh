#!/bin/bash

CURRENT_DATE=$(date +%d-%m-%Y)
OUTPUT_FILE=./last_five-$CURRENT_DATE
FILES=($(sudo find /var/log/* -type f -mtime -5))
for FILE in "${FILES[@]}"; do
    echo "FILE" >> $OUTPUT_FILE
done