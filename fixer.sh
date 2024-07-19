#!/bin/bash

# List of possible partitions
partitions=$(lsblk -lnpo NAME,TYPE | awk '$2=="part" {print $1}')

# Mount point base directory
mount_base="/mnt"

# Function to delete the specified file
delete_file() {
    local mount_point=$1
    local dir="$mount_point/Windows/System32/drivers/CrowdStrike"

    if [ -d "$dir" ]; then
        find "$dir" -type f -name "C-00000291*.sys" -exec bash -c 'echo "Deleted $1!"; rm -f "$1"' _ {} \;
    fi
}

# Mount each partition and attempt to delete the file
for partition in $partitions; do
    mount_point="$mount_base/$(basename $partition)"
    mkdir -p "$mount_point"
    mount "$partition" "$mount_point" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "Mounted $partition to $mount_point"
        delete_file "$mount_point"
        umount "$mount_point"
	echo "Unmounted $partition"
    else
        echo "Failed to mount $partition"
    fi
done

# Shutdown the system
echo "Shutdown in 3 seconds."
sleep 3
shutdown now
