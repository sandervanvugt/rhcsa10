#!/usr/bin/env bash
set -e

# Get all disk devices (excluding partitions), one per line
mapfile -t disks < <(lsblk -dn -o NAME,TYPE | awk '$2=="disk" {print "/dev/" $1}')

# Make sure at least two disks are present
if (( ${#disks[@]} < 2 )); then
  echo "Error: less than two disks detected." >&2
  exit 1
fi

# The second disk is:
second_disk="${disks[1]}"

echo "Second disk detected as: $second_disk"


if [ -n $second_disk ]
then
	echo -e "\033[32m[OK]\033[0m\t\t block device \033[1m${second_disk}\033[0m was found"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t block device \033[1m${second_disk}\033[0m was not found"
fi


if [ -b ${second_disk}.*1 ] && [ -b ${second_disk}.*2 ]
then
	echo -e "\033[32m[OK]\033[0m\t\t two partitions were found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t two partitions were not found"
fi
TOTAL=$(( TOTAL + 10 ))



if fdisk -l /dev/${second_disk} | awk '${second_disk}.*1/ && /1G/' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the first partition has a size of 1G"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t incorrect size on first partition"
fi
TOTAL=$(( TOTAL + 10 ))


if [[ $(fdisk -l /dev/sdb | awk '/sdb2/ && /1G/' &>/dev/null) ]]
then
	echo -e "\033[32m[OK]\033[0m\t\t the second partition has a size of 5G and is marked as LVM partition"
	SCORE=$(( SCORE + 10 ))
else
	if [[ $(fdisk -l /dev/sdb | awk '/sdb2/ && !/lvm/') ]]
	then
		echo -e "\033[31m[FAIL]\033[0m\t\t type of the second partition is incorrect"
	fi
	if [[ $(fdisk -l /dev/sdb | awk '/sdb2/ && !/5G/') ]]
        then
                echo -e "\033[31m[FAIL]\033[0m\t\t size of the second partition is not correct"
        fi
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
