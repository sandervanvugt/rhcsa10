if ssh server2.example.com grep '^root:...*:' /etc/shadow &>/dev/null" 
then
	echo -e "\033[32m[OK]\033[0m\t\t user root on server2 seems to have a password"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t user root on server2 doesnt seem to have a password"
fi
TOTAL=$(( TOTAL + 10 ))
