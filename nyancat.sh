#!/usr/bin/env bash

img_num=1

aplay nyancat.wav 2>&1 /dev/null &
play_pid=$!

while true; do
    cat nyancat-${img_num}.ans

    if ! ps -p $play_pid > /dev/null ; then
        aplay nyancat.wav 2>&1 /dev/null &
        play_pid=$!
    fi
    
    ((img_num++))

    if [[ $img_num -gt 5 ]]; then
        img_num=1
    fi
    sleep .075
    clear
done

