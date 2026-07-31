#!/bin/bash 

mkdir -p logs 

LOG_FILE="logs/cpu_$(date +%F).log"


echo "==============================================" > "$LOG_FILE"
echo "CPU MONITOR REPORT" >> "$LOG_FILE"
echo "Date : $(date)" >> "$LOG_FILE"
echo "==============================================" >> "$LOG_FILE"


echo "" >> "$LOG_FILE"

echo "CPU Model:" >> "$LOG_FILE"
lscpu | grep "Model name" >> "$LOG_FILE"

echo "" >> "$LOG_FILE"


echo "CPU Architecture:"  >> "$LOG_FILE" 
lscpu | grep "Architechture" >> "$LOG_FILE"

echo "" >> "$LOG_FILE"

echo "System Load:" >> "$LOG_FILE"
uptime >> "$LOG_FILE"

echo "" >> "$LOG_FILE"

echo "TOP 5 CPU PROCESSES:" >> "$LOG_FILE"
ps -eo pid,user,comm,%cpu --sort=-%cpu | head -6 >> "$LOG_FILE"

echo "CPU report saved to $LOG_FILE"
