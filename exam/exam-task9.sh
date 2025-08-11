if grep 'examlabs.example.com' /etc/hostname &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t hostname is set to examlabs.example.com"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t hostname is not set to examlabs.example.com"
fi
TOTAL=$(( TOTAL + 10 ))

if systemctl is-enabled httpd &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the \033[1mhttpd\033[0m service is enabled"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t \033[1mhttpd\033[0m service is not enabled"
fi
TOTAL=$(( TOTAL + 10 ))

if firewall-cmd --list-all | grep services | grep http &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t \033[1mfirewalld\033[0m allows access to http"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t \033[1mfirewalld\033[0m does not allow access to http"
fi
TOTAL=$(( TOTAL + 10 ))
