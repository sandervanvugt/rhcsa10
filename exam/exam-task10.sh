if which showmount &>/dev/null
then
	if showmount -e server2 | grep homes &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t NFS shared directory /homes offered by server2"
		SCORE=$(( SCORE + 10 ))
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t NFS shared directory /homes not offered by server2"
	fi
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the nfs-utils package doesnt seem to be installed"
fi
TOTAL=$(( TOTAL + 10 ))

if [ -f /etc/auto.master ] &>/dev/null
then
	export AUTOFSFILE=$(awk '/homes/ { print $2 }' /etc/auto.master)
	if grep '\*.*/homes/&' $AUTOFSFILE &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t wildcard mount correctly configured"
		SCORE=$(( SCORE + 10 ))
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t wildcard mount not correctly configured"
	fi
else
	echo -e "\033[31m[FAIL]\033[0m\t\t /etc/auto.master does not exist"
fi
TOTAL=$(( TOTAL + 10 ))

if systemctl is-enabled autofs &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t the autofs service is enabled"
	SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t the autofs service is not enabled"
fi
TOTAL=$(( TOTAL + 10 ))
