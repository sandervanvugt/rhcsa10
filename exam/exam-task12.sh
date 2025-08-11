
if podman login --get-login &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t you seem to be logged in to pull images"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t you're not logged in to any registry"
fi
TOTAL=$(( TOTAL + 10 ))

if podman images | grep greeter &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t container image greeter was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t container image greeter was not found"
fi
TOTAL=$(( TOTAL + 10 ))


if podman ps | grep sleeper &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found a running container sleeper"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find a running container sleeper"
fi
TOTAL=$(( TOTAL + 10 ))
