#find /etc -type f -exec grep -Ri 'administrator' {} \; > /root/lab15.check &>/dev/null

ssh server2 find /etc -type f -readable -print0 | xargs -0 -r grep -i 'administrator' 2>/dev/null > /root/lab15.check
scp server2:/root/administratorfiles.txt /root/administratorfiles.txt

if diff -u <(sort /root/lab15.check) <(sort /root/administratorfiles.txt) &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t you correctly identified all files in /etc that contain the text administrator"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t you did not correctly identify all files in /etc that contain the text administrator"
fi
TOTAL=$(( TOTAL + 10 ))
