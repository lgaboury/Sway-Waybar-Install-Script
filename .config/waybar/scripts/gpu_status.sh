#!/bin/sh

gpu_status=$(cat /proc/acpi/bbswitch | awk '{print $2}')

echo '{"text": "'$gpu_status'", "tooltip": "GPU Status"}'
