if ssh server2 grep 'Listen.*82' /etc/httpd/conf/httpd.conf &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t server2 httpd server is listening on port 82"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t server2 httpd server is not listening on port 82"
fi
TOTAL=$(( TOTAL + 10 ))


if ssh server2 ls -Z /var/www/html/hosts | grep httpd_sys_content &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the file hosts has been labeled for httpd access"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the file hosts has not been labeled for httpd access"
fi
TOTAL=$(( TOTAL + 10 ))
