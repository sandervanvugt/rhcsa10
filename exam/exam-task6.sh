if ssh server2 getent chisha | grep 1234 &>/dev/null && ssh server2 getent myapp | grep nologin &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t users chisha and myapp were correctly created"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t users chisha and myapp were not correctly created"
fi
TOTAL=$(( TOTAL + 10 ))

if grep sales /etc/group | grep chisha | grep caroline &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t group sales was found with correct membership"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t group sales with correct membership was not found"
fi
TOTAL=$(( TOTAL + 10 ))
