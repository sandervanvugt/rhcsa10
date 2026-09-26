#test -f fails (binary operator expected), a simple ls proves the presence of the file or multiple files
if ssh server2 ls /home/chisha/.config/systemd/user/*timer &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t a systemd timer file was found in the user homedirectory"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t a systemd timer file was not found in the user homedirectory"
fi
TOTAL=$(( TOTAL + 10 ))
#could have put Mon,Tue,Wed,Thu,Fri or Mon..Fri time is meant to be 2am on the dot.
if ssh server2 grep 'OnCalendar.*Mon.*Fri.*02:0' /home/chisha/.config/systemd/user/*timer &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the timer is scheduled for the correct time"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the timer is not scheduled for the correct time"
fi
TOTAL=$(( TOTAL + 10 ))

#test -f fails (binary operator expected), a simple ls proves the presence of the file or multiple files
if ssh server2 ls /home/chisha/.config/systemd/user/timers.target.wants/*timer &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the timer service is enabled for the user"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the timer service is not enabled for the user"
fi
TOTAL=$(( TOTAL + 10 ))

