#!/bin/bash

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0
MATCH_LINES=()

if [ -z "$LOGFILE" ]; then
    echo "========================================================"
    echo "  Usage: ./script4.sh <logfile> [keyword]"
    echo "  Example: ./script4.sh /var/log/syslog error"
    echo "  Example: ./script4.sh /var/log/mysql/error.log Warning"
    echo "========================================================"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    RETRIES=0
    MAX_RETRIES=3
    while [ $RETRIES -lt $MAX_RETRIES ]; do
        RETRIES=$((RETRIES + 1))
        echo "  Attempt $RETRIES/$MAX_RETRIES: File '$LOGFILE' not found. Retrying in 1 second..."
        sleep 1
        if [ -f "$LOGFILE" ]; then
            break
        fi
    done
    if [ ! -f "$LOGFILE" ]; then
        echo "  Error: File '$LOGFILE' could not be found after $MAX_RETRIES attempts."
        echo "  Please verify the path and try again."
        exit 1
    fi
fi

if [ ! -s "$LOGFILE" ]; then
    echo "  Warning: Log file '$LOGFILE' exists but is empty."
    echo "  No analysis to perform."
    exit 0
fi

echo "========================================================"
echo "         Log File Analyzer                               "
echo "========================================================"
echo ""
echo "  Log File : $LOGFILE"
echo "  Keyword  : $KEYWORD"
echo "  Scanning..."
echo ""

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        MATCH_LINES+=("$LINE")
    fi
done < "$LOGFILE"

TOTAL_LINES=$(wc -l < "$LOGFILE")

echo "  Total Lines  : $TOTAL_LINES"
echo "  Keyword Hits : $COUNT"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "--------------------------------------------------------"
    echo "  Last 5 Matching Lines"
    echo "--------------------------------------------------------"
    START=$(( ${#MATCH_LINES[@]} - 5 ))
    [ $START -lt 0 ] && START=0
    for i in "${!MATCH_LINES[@]}"; do
        if [ $i -ge $START ]; then
            echo "  ${MATCH_LINES[$i]}"
        fi
    done
else
    echo "  No lines matching '$KEYWORD' were found in the log file."
fi

echo ""
echo "========================================================"
echo "  Analysis complete."
echo "========================================================"
