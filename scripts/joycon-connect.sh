#!/usr/bin/env bash

MAC1="$(cat /run/secrets/joycon_l1)"
MAC2="$(cat /run/secrets/joycon_r1)"

bluetoothctl remove "$MAC1"
bluetoothctl remove "$MAC2"

{
    echo "scan on"
    sleep 3
    echo "connect $MAC1"
    echo "connect $MAC2"
    sleep 10
} | bluetoothctl
