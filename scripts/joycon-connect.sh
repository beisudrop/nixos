#!/usr/bin/env bash

MAC1="5C:0C:E6:79:69:A3"
MAC2="5C:0C:E6:78:9D:FF"

bluetoothctl remove "$MAC1"
bluetoothctl remove "$MAC2"

{
    echo "scan on"
    sleep 3
    echo "connect $MAC1"
    echo "connect $MAC2"
    sleep 10
} | bluetoothctl
