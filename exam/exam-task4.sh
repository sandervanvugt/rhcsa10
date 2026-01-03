export EXT4ID=$(blkid | awk '/ext4/ { print $2 }' | cut -d\" -f2)
export SWAPID=$(blkid | awk '/swap/ && !/mapper/ { print $2 }' | cut -d\" -f2 )

if [ -z $EXT4ID ] || [ -z $SWAPID ]
then
	echo -e "\033[31m[FAIL]\033[0m\t\t could find both the ext4 partition as the swap partition"
else
	echo -e "\033[32m[OK]\033[0m\t\t the ext4 partition and the swap partition were found"
	SCORE=$(( SCORE + 10 ))
fi
TOTAL=$(( TOTAL + 10 ))

if [ -z $EXT4ID ] || [ -z $SWAPID ]
then
	echo -e "\033[31m[FAIL]\033[0m\t\t could find fstab entries for the ext4 partition and the swap partition"
else
	if grep ${EXT4ID}.*files /etc/fstab &>/dev/null && grep ${SWAPID}.*swap /etc/fstab &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t found both filesystems in /etc/fstab"
		SCORE=$(( SCORE + 10 ))
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t filesystems not found in /etc/fstab"
	fi
fi
TOTAL=$(( TOTAL + 10 ))

if mount | grep '/mnt/files' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the ext4 partition was found as mounted"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the ext4 partition was not found as mounted"
fi
TOTAL=$(( TOTAL + 10 ))

# finding swap device name
if [ -z $SWAPID ]
then
	echo -e "\033[31m[FAIL]\033[0m\t\t the swap device was not found"
else
	if export SWAPDEV=$(blkid | grep $SWAPID | cut -d : -f 1) &>/dev/null
	then
		echo SWAPDEV is $SWAPDEV
		# evaluating availability
		if swapon -s | grep $SWAPDEV &>/dev/null
		then
       		 	echo -e "\033[32m[OK]\033[0m\t\t swap device is active"
        		SCORE=$(( SCORE + 10 ))
		else
        		echo -e "\033[31m[FAIL]\033[0m\t\t swap device is not currently active"
		fi
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t the swap device name could not be determined"
	fi
fi
TOTAL=$(( TOTAL + 10 ))
