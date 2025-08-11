rm -f /tmp/score.txt
rm -f /tmp/total.txt

####opening a shell as user student for testing
sudo -u student -i <<HERE

####checking user student access to a repository

if podman login --get-login &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t you are logged in to at least one registry"
        echo 10 > /tmp/score.txt
else
        echo -e "\033[31m[FAIL]\033[0m\t\t i cannot find any podman login credentials"
        echo -e "Did you use \033[1mpodman login registryname\033[0m to login to the registry?"
fi
echo 10 > /tmp/total.txt

####check that mydb is running
if podman ps | grep mydb &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t good! I can find the container mydb. Let's check all required conditions"
        if ls /home/student/mariadb/mysql.sock &>/dev/null
        then
                echo -e "\033[32m[OK]\033[0m\t\t database has been created"
                echo 10 >> /tmp/score.txt
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t the database has not been created"
                echo -e "Did you use the \033[1m:Z\033[0m option while creating the bind mount?"

        fi
        if podman ps | grep mydb | grep 3206 &>/dev/null
        then
        echo -e "\033[32m[OK]\033[0m\t\t container exposed on host port 3206"
        echo 10 >> /tmp/score.txt
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t the database has not been created"
                echo -e "Did you use the \033[1m:Z\033[0m option while creating the bind mount?"

        fi
        if podman ps | grep mydb | grep 3206 &>/dev/null
        then
        echo -e "\033[32m[OK]\033[0m\t\t container exposed on host port 3206"
        echo 10 >> /tmp/score.txt
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t the container isn't listening on host port 3206"
                echo -e "Did you use the \033[1m-p 3206:3206\033[0m option while running the container"

        fi

else
        echo -e "\033[31m[FAIL]\033[0m\t\t the container mydb was not found"
fi
echo 20 >> /tmp/total.txt

####closing the user student shell
HERE

SUDOSCORE=$(awk '{sum += $1} END {print sum}' /tmp/score.txt)
SUDOTOTAL=$(awk '{sum += $1} END {print sum}' /tmp/total.txt)
SCORE=$(( SCORE + SUDOSCORE ))
TOTAL=$(( TOTAL + SUDOTOTAL ))
echo #debug the total is $TOTAL
echo #debug the current score is $SCORE

