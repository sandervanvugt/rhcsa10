if ssh server2 test -f /home/chisha/.config/systemd/user/*timer &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t a systemd timer file was found in the user homedirectory"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t a systemd timer file was not found in the user homedirectory"
fi
TOTAL=$(( TOTAL + 10 ))

if ssh server2 grep 'OnCalendar=Mon..Fri *-*-* 02:00:00' /home/chisha/.config/systemd/*timer &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the timer is scheduled for the correct time"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the timer is not scheduled for the correct time"
fi
TOTAL=$(( TOTAL + 10 ))

if ssh server2 test -f /home/chisha/.config/systemd/user/default.target.wants/*timer &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the timer service is enabled for the user"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the timer service is not enabled for the user"
fi
TOTAL=$(( TOTAL + 10 ))

