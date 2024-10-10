#!/bin/bash

# Check if smartmontools is installed
if ! command -v sudo smartctl &> /dev/null
then
    echo "smartctl could not be found, please install smartmontools."
    exit 1
fi

# Get a list of all drives
drives=$(lsblk -dn -o NAME)

# Check SMART status for each drive
for drive in $drives; do
    device="/dev/$drive"
    echo "Checking SMART status of $device"
    result=$(sudo smartctl -H $device | grep "SMART overall-health self-assessment test result")

    if [[ "$result" == *"PASSED"* ]]; then
        echo "$device: SMART status PASSED"
    else
        echo "$device: SMART status FAILED"
        exit 1
    fi
    echo "--------------------------------------"
done
