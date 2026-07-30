#!/bin/bash

REPORT="reports/system_report_$(date +%F_%H-%M-%S).txt"


echo "==============================================" > "$REPORT"

echo "          SYSTEM INFORMATION REPORT           " >> "$REPORT"

echo "==============================================" >> "$REPORT"
echo "" >> "$REPORT"


echo "Date & Time: $(date)" >> "$REPORT"
echo "Hostname: $(hostname)" >> "$REPORT"
echo "Current User: $(whoami)" >> "$REPORT"
echo "Operating system:" >> "$REPORT"
cat /etc/os-release | grep PRETTY_NAME >> "$REPORT"
echo "" >> "$REPORT"

echo "Kernel Version:" >> "$REPORT"
uname -r >> "$REPORT"
echo "" >> "$REPORT"

echo "System Uptime:" >> "$REPORT"
uptime -p >> "$REPORT"

echo "" >> "$REPORT"

echo "CPU Information:" >> "$REPORT"
lscpu | grep "Model Name" >> "$REPORT"
echo "" >> "$REPORT"

echo "Memory Information:" >> "$REPORT"
free -h >> "$REPORT"


echo ""
echo "Report generates successfully!"
echo "Saved at: $REPORT"
