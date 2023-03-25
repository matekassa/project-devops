#!/bin/bash

CURRENT_DATE=$(date +%d-%m-%Y)
OUTPUT_FILE=./mod-$CURRENT_DATE.out
sudo ls -lt /var/log | head -n 4 | sed /^total/d | awk '{print $9}' > $OUTPUT_FILE