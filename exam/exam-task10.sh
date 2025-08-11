if grep 'PASS_MAX_DAYS.*90' /etc/login.defs &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t password validity set to 90 days"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t password validity not set to 90 days"
fi
TOTAL=$(( TOTAL + 10 ))


if [ -f /etc/skel/newfile ] &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t empty file newfile will be created in new user homedirectories"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no empty file newfile will be created in new user homedirectories"
fi
TOTAL=$(( TOTAL + 10 ))


if grep -q 'anna' /etc/passwd && grep -q 'anouk' /etc/passwd && grep -q 'linda' /etc/passwd && grep -q 'lisa' /etc/passwd &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t all requested users exist"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t one or more requested users does not exist"
fi
TOTAL=$(( TOTAL + 10 ))


if lid -g profs | grep anna &>/dev/null && lid -g profs | grep anouk &>/dev/null && lid -g students linda &>/dev/null && lid -g students lisa &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the users are all member of the requested groups"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t one or more users is not in the right secondary groups"
fi
TOTAL=$(( TOTAL + 10 ))


if test -d /data/profs && test -d /data/students &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the directories /data/profs and /data/students exist"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t at least one of the directories /data/profs and /data/students doesn't exist"
fi
TOTAL=$(( TOTAL + 10 ))


if ls -ld /data/* | grep 'd...rwx---' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t shared group directories permissions set correctly"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t shared group directories permissions not set correctly"
fi
TOTAL=$(( TOTAL + 10 ))
