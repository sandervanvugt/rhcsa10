#if test -z /etc/hostname &>/dev/null
#then
#	echo -e "\033[32m[OK]\033[0m\t\t hostname is set to examlabs.example.com"
#	SCORE=$(( SCORE + 10 ))
#else
	echo -e "\033[31m[WARNING]\033[0m\t\t bug-fixing: this task is not currently evaluated"
#fi
#TOTAL=$(( TOTAL + 10 ))
