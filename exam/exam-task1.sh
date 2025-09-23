if ping -c 1 server1.example.com &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t server1.example.com is alive"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t server1.example.com is not alive"
fi
TOTAL=$(( TOTAL + 10 ))

if ping -c 2 server2.example.com &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t server2.example.com is alive"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t server2.example.com is not alive"
fi
TOTAL=$(( TOTAL + 10 ))
