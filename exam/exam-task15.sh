grep -Ri 'administrator' /etc/* > /tmp/lab15.check &>/dev/null

if diff /tmp/lab15.check /root/administratorfiles.txt &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t you correctly identified all files in /etc that contain the text administrator"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[WARNING]\033[0m\t\t you did not correctly identify all files in /etc that contain the text administrator"
fi
TOTAL=$(( TOTAL + 10 ))
