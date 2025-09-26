if grep -v rhel /etc/chrony.conf | grep -v '^#' | grep 'pool.*pool.ntp.org' &>/dev/null && ssh server2 grep -v rhel | /etc/chrony.conf | grep -v '^#' | grep 'pool.*pool.ntp.org' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t both servers are using the right NTP configuration"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t both servers not configured with the right NTP configuration"
fi
TOTAL=$(( TOTAL + 10 ))

