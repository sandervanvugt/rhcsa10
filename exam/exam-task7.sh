if ssh server2 ls -ld /data/sales | grep rwxrws--T.*chisha.*sales &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t /data/sales on server2 is configured with the right permissions and owners."
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t /data/sales on server2 is not configured with the right permissions and owners."
fi
TOTAL=$(( TOTAL + 10 ))
