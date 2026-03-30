#!/bin/bash
# Script 4: Log File Analyzer
# Usage: bash script4.sh logfile.txt error
# Author: Aniket Pandey | Reg: 24BSA10012

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

# Retry if the file is empty
RETRIES=0
while [ ! -s "$LOGFILE" ] && [ $RETRIES -lt 3 ]; do
    echo "File is empty. Retrying... ($((RETRIES+1))/3)"
    sleep 1
    RETRIES=$((RETRIES + 1))
done

if [ ! -s "$LOGFILE" ]; then
    echo "File is still empty after retries. Exiting."
    exit 1
fi

# Read line by line and count keyword matches
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"

# Print the last 5 matching lines
echo ""
echo "Last 5 matching lines:"
echo "----------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5