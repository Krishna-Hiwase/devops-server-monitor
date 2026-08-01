!/bin/bash 

while true 
do
	clear

	echo "##################################################"
	echo "    DEVOPS SERVER  MONITOR "
	echo "#################################################"
	echo " 1.system Information "
	echo " 2. Memory & Disk Monitor"
	echo " 3. CPU Monitor"
	echo " 4. Log Analyzer"
	echo " 5. Exit "
	echo "================================================="

	read -p "Enter your choice: " choice 

	case $choice in 
		1)
			bash system_info.sh
			;;

		2)      
			bash memory_monitor.sh 
			;;
		3) 
			bash  cpu_monitor.sh
			;;
		4) 
			bash log_analyzer.sh 
			;;
		5)
			echo "GOOD BYE...."
			exit
			;;
		*)
			echo "invalid choice"
	esac


	echo 
	read -p "Press Enter to Continue....."
done


