if [ -f /etc/systemd/system/sleep.service ] &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t sleep.service found in the right location"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t sleep.service not found in the right location"
fi
TOTAL=$(( TOTAL + 10 ))

if grep 'WantedBy=multi-user.target' /etc/systemd/system/sleep.service &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t \033[1msleep.service\033[0m is enabled"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t \033[1msleep.service\033[0m is not enabled"
fi
TOTAL=$(( TOTAL + 10 ))

if grep 'Restart=always' /etc/systemd/system/sleep.service &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t service will automatically restart"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t Restart option not found"
fi
TOTAL=$(( TOTAL + 10 ))

