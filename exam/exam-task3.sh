if file /rhel10.iso | grep 9660 &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t /rhel10.iso file was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t /rhel10.iso file was not found"
fi
TOTAL=$(( TOTAL + 10 ))

if mount | grep /repo | grep rhel10 &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t the rhel10.iso file is mounted on /repo"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t the rhel10.iso file is not mounted on /repo"
fi
TOTAL=$(( TOTAL + 10 ))

if ls -Z /repo | grep httpd_sys_content_t &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the /repo directory has the right SELinux label"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t the /repo directory doesn't have the right SELinux label"
fi
TOTAL=$(( TOTAL + 10 ))

if grep DocumentRoot.*/repo /etc/httpd/conf/httpd.conf &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t the httpd DocumentRoot is set to /repo"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t the /repo directory is not set as the httpd DocumentRoot"
fi
TOTAL=$(( TOTAL + 10 ))

if grep -l server1 /etc/yum.repos.d/* &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t server1 is set as the repository server on server1"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t server1 is not set as the repository server on server1"
fi

if ssh root@server2 "grep -l server1 /etc/yum.repos.d/*" &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t server1 is set as the repository server on server2"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t server1 is not set as the repository server on server2"
fi

if grep "baseurl /etc/yum.repos.d/* | grep redhat.com &>/dev/null
then
        echo -e "\033[31m[FAIL]\033[0m\t\t this server has been registered using subscription manager. This is a critical error. \033[31mYOU HAVE FAILED THE EXAM\033[0m"
	exit 9
fi

