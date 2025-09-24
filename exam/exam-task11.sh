if grep 'pool.*pool.ntp.org' /etc/chronyd.conf &>/dev/null && ssh server2 grep 'pool.*pool.ntp.org' /etc/chronyd.conf &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t both servers are using the right NTP configuration"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t both servers not configured with the right NTP configuration"
fi
TOTAL=$(( TOTAL + 10 ))

