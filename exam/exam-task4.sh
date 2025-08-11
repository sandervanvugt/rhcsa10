if ps aux | grep 'sleep infinity' | grep -v grep &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found a process \033[1msleep infinity\033[0m"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the process \033[1msleep infinity\033[0m was not found"
fi
TOTAL=$(( TOTAL + 10 ))


if [[ $(ps -eo ni,cmd,pid | awk '/sleep/ && /infinity/ && !/awk/ { print $1 }') == 19 ]] &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found correct niceness of 19"
	SCORE=$(( SCORE + 10 ))
else
	if [[ $(ps -eo ni,cmd,pid | awk '/sleep/ && /infinity/ && !/awk/ { print $1 }' | wc -l) -gt 1 ]] &>/dev/null
	then
		echo -e "\033[31m[FAIL]\033[0m\t\t multiple sleep infinity processes found"
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t niceness of 19 was not found"
	fi
fi
TOTAL=$(( TOTAL + 10 ))

if grep -d skip -l 'sleep infinity' /home/student/.* &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found the command in $(grep -d skip -l 'sleep infinity' /home/student/.*)"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t command not found in any of the startup files for user student"
fi
TOTAL=$(( TOTAL + 10 ))
