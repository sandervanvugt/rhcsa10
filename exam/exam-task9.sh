if ssh server2 "runuser -u chisha -- flatpak list" | grep -i gimp &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t user chisha has gimp installed"
	if ssh server2 "runuser -u anna  -- flatpak list" | grep -i gimp" &>/dev/null
	then
		echo -e "\033[31m[FAIL]\033[0m\t\t user anna also has access to the gimp flatpak and that's wrong"
	else	
		echo -e "\033[32m[OK]\033[0m\t\t user anna has no access to the gimp flatpak"
		SCORE=$(( SCORE + 10 ))
	fi
else
	echo -e "\033[31m[WARNING]\033[0m\t\t user chisha does not have gimp installed"
fi
TOTAL=$(( TOTAL + 10 ))
