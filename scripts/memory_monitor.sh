#!/bin/bash 

mkdir -p logs 

LOG_FILE="logs/memory_$(date +%F).log"


echo "=================================" >  "$LOG_FILE"
echo "MEMORY REPORTS" >>  "$LOG_FILE"
echo "Date : $(date)" >>  "$LOG_FILE"
echo "=================================" >>  "$LOG_FILE"

echo "" >>  "$LOG_FILE"

free -h >>  "$LOG_FILE"

echo "" >>  "$LOG_FILE"

echo "TOP 5 memory Processes:" >>  "$LOG_FILE"
ps -eo pid,user,comm,%mem --sort=-%mem | head -6 

echo "Memory report saved to  $LOG_FILE"

