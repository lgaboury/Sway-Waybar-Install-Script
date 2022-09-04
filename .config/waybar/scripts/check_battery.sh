#!/bin/sh

CRIT=${1:-15}

for capacity in $(find /sys/class/power_supply/*/ -type f -name capacity)
do
	stat=$(cat ${capacity/capacity/status})
	perc=$(cat $capacity)
	bat=$(echo $capacity | cut -d'/' -f5)
	if [ $perc -le $CRIT ] && [ $stat == "Discharging" ]; then
		if [ ! -f notified ]; then
			notify-send --urgency=critical --icon=dialog-warning "Battery Low" "Current charge of $bat: $perc%"
			touch notified
		fi
	else
		if [ -f notified ]; then
			rm notified
		fi
	fi
done

