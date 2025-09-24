if grep 'DocumentRoot.*/web' /etc/httpd/conf/httpd.conf &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t httpd DocumentRoot is set to /web"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t httpd DocumentRoot is not set to /web"
fi
#TOTAL=$(( TOTAL + 10 ))


if grep 'Directory.*/web' /etc/httpd/conf/httpd.conf &>/dev/null &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t apache restrictions see to allow access to web content in /web"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t apache restrictions don't seem the allow access to web content in /web"
fi
#TOTAL=$(( TOTAL + 10 ))

if grep 'hello from' /web/index.html &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t requested web content was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t requested web content not found"
fi
#TOTAL=$(( TOTAL + 10 ))


if curl localhost 2>/dev/null | grep 'hello from' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t web content at custom location is reachable"
	SCORE=$(( SCORE + 30 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t web content at custom location is not reachable"
fi
#TOTAL=$(( TOTAL + 30 ))
