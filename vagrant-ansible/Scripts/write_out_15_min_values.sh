#!/bin/bash

LOADAVG_FILE="/proc/loadavg"
LOADAVG=$(awk '{print $3}' "$LOADAVG_FILE")
echo "The 15 minutes load average value from $LOADAVG_FILE: $LOADAVG"