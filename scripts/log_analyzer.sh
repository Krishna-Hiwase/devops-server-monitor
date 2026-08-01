#!/bin/bash

mkdir -p ../reports

LOG_FILE="../logs/app.log"
REPORT="../reports/log_report_$(date +%F_%H-%M-%S).txt"

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found!"
    exit 1
fi

{
echo "========== LOG REPORT =========="
echo "Date: $(date)"
echo

echo "Total Lines:"
wc -l < "$LOG_FILE"

echo
echo "Error Count:"
grep -c "ERROR" "$LOG_FILE"

echo
echo "Warning Count:"
grep -c "WARNING" "$LOG_FILE"

echo
echo "Last 10 Log Entries:"
tail -10 "$LOG_FILE"

} > "$REPORT"

echo "Report saved to $REPORT"
