#!/bin/bash

print_bytes() {
    # if [ "$1" -lt 1000 ]; then
    #     output="$1 KB"
    # elif [ "$1" -lt 1000000 ]; then
    #     output="$(echo "$1/1000" | bc -l | LANG=C xargs printf "%.f\n") KB"
    # else
    #     output="$(echo "$1/1000000" | bc -l | LANG=C xargs printf "%.1f\n") MB"
    # fi

    echo "$1 KB"
}

INTERVAL=1
# INTERFACES="enp0s25 wlp3s0"
INTERFACES="enp4s0"

declare -A bytes

for interface in $INTERFACES; do
    bytes[past_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
    bytes[past_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"

    # echo "$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
done

while true; do
    down=0
    up=0

    for interface in $INTERFACES; do
        
        bytes[now_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
        bytes[now_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"

        bytes_down=$((((${bytes[now_rx_$interface]} - ${bytes[past_rx_$interface]})) / INTERVAL))
        bytes_up=$((((${bytes[now_tx_$interface]} - ${bytes[past_tx_$interface]})) / INTERVAL))

        down=$(((( "$down" + "$bytes_down" ))))
        up=$(((( "$up" + "$bytes_up" ))))

        bytes[past_rx_$interface]=${bytes[now_rx_$interface]}
        bytes[past_tx_$interface]=${bytes[now_tx_$interface]}


        # show_down=print_bytes $bytes_down
        # show_up=print_bytes $bytes_up

        # echo "DOWN: $bytes_down | UP: $bytes_up"
        echo "DOWN: $(print_bytes $bytes_down) | UP: $(print_bytes $bytes_up)"
    done

    # echo "DOWN: $(print_bytes $down) | UP: $(print_bytes $up)"
    

    sleep $INTERVAL
done