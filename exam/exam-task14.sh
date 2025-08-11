
####checking the systemd parts
if [ -f /home/student/.config/systemd/user/container-mydb.service ] &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t systemd user unit was found"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t systemd user unit was not found. Check the following:"
        echo -e "-\tuse \033[1mmkdir ~.config/systemd/user\033[0m to create the directory where it must be created"
        echo -e "-\tuse \033[1mpodman generate systemd\033[0m with the appropriate options to generate it"
fi
TOTAL=$(( TOTAL + 10 ))

####checking if the systemd unit is enabled
if ps aux | grep conmon | grep student | grep mydb &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t the container is currently running as a systemd unit"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t the container is not currently running as a systemd unit. Did you use \033[1msystemctl enable --user container-mydb.service\033[0m to enable it?"
fi
TOTAL=$(( TOTAL + 10 ))

