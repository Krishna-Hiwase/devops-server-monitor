#!/bin/bash 

mkdir -p ../reports

REPORT="../reports/health_report_$(date +%F_%H-%M-%S).txt"

{
echo "++++++++++++++++++++++++++++++++++++++++++++++"
echo "DEVOPS SERVER HEALTH REPORT"
echo "++++++++++++++++++++++++++++++++++++++++++++++"
echo "Generated:$(date)"
echo 

echo "==========System INFORMATION ================"
hostname 
uname -a


echo 
echo "============UPTIME======================="
uptime 

echo
echo "=============Memory==================="
free -h 


echo
echo "==============DISK USAGE================="
df -h 

echo 
echo "===============CPU======================"
top -bn1 | grep "Cpu(s)"


echo 
echo "================TOP 5 CPU PROCESSES ==========="
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -6

echo 
echo "============== LAST 10 LOG ENTRIES =========="
if [ -f ../logs/app.log  ]; then 
	tail -10 ../logs/app.log
else 
	echo "NO log file found."
fi

} > "$REPORT" 

echo "HEALTH reort generated successfully!"
echo "report location: $REPORT"

