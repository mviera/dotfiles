#!/bin/bash

devices_paired=$(bluetoothctl devices | grep Device | cut -d ' ' -f 2)
echo "$devices_paired" | while read -r line; do
    bluetoothctl connect "$line" >> /dev/null
done
