#!/usr/bin/env bash
layout=$(setxkbmap -query | awk '/layout/ {print $2}')
if [ "$layout" = "de" ]; then
    setxkbmap us
else
    setxkbmap de
fi
