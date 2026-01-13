ssh server2 "find /usr -perm /6000 -size -100k | awk -F\"/\" '{ print \$NF }' | sort > /tmp/suidgidcheck"

if ssh server2 "ls /root/sugidfiles/ | awk '{ print \$NF }' > /root/sugidfiles.files; diff /tmp/suidgidcheck /root/sugidfiles.files &>/dev/null"
then
	echo -e "\033[32m[OK]\033[0m\t\t you correctly identified all SUID and SGID files"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t you did not correctly identify all SUID and SGID files"
fi
TOTAL=$(( TOTAL + 10 ))
