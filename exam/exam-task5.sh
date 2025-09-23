export VGUSEDBYMYFILES=$(lvdisplay | grep -A3 myfiles | awk '/VG Name/ { print $3 }')
export VGUSEDBYROOT=$(lvdisplay | grep -A3 root | awk '/VG Name/ { print $3 }')

if vgdisplay $(echo VGUSEDBYMYFILES | grep 'PE Size' | grep '8.00') &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the VG used by the LV myfiles uses 8 MiB extents"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the VG used by the LV myfiles does not use 8MiB extents"
fi
TOTAL=$(( TOTAL + 10 ))

if grep myfiles.*/mnt/data /etc/fstab &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the \033[1mmyfiles\033[0m LV mounts on /mnt/data"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the \033[1mmyfiles\033[0m LV does not mount on /mnt/data"
fi
TOTAL=$(( TOTAL + 10 ))

if vgdisplay | grep -A 15 $VGUSEDBYROOT | grep 'Cur PV.*2' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the root logical volume \033[1mlvlabs\033[0m was resized"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the root logical volume was not resized"
fi
TOTAL=$(( TOTAL + 10 ))
