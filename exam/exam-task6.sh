if vgs | grep vglabs &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t volume group \033[1mvglabs\033[0m was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no volume group \033[1mvglabs\033[0m was found"
fi
TOTAL=$(( TOTAL + 10 ))

if vgdisplay vglabs | grep 'PE Size' | grep '2' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t \033[1mvglabs\033[0m PE size is correct"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t \033[1mvglabs\033[0m PE size is not correct"
fi
TOTAL=$(( TOTAL + 10 ))

if lvs | grep lvlabs &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t logical volume \033[1mlvlabs\033[0m was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t logical volume \033[1mlvlabs\033[0m was not found"
fi
TOTAL=$(( TOTAL + 10 ))

LVSIZE=$(lvdisplay /dev/vglabs/lvlabs | awk '/Current LE/ { print $3 }')
VGSIZE=$(vgdisplay vglabs | awk '/Total PE/ { print $3 }')
HALF=$(( VGSIZE / 2 ))

if [ $LVSIZE -eq $HALF ]
then
	echo -e "\033[32m[OK]\033[0m\t\t logical volume \033[1mlvlabs\033[0m uses 50% of available extents"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t logical volume \033[1mlvlabs\033[0m does not use 50% of available extents"
fi
TOTAL=$(( TOTAL + 10 ))

if true
then
	echo -e "\033[32m[OK]\033[0m\t\t "
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t "
fi
TOTAL=$(( TOTAL + 10 ))
