find /usr -perm /6000 -size -100k > /tmp/suidgidcheck

if diff /tmp/suidgidcheck /root/sugidfiles &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t you correctly identified all SUID and SGID files"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[WARNING]\033[0m\t\t you did not correctly identify all SUID and SGID files"
fi
TOTAL=$(( TOTAL + 10 ))
