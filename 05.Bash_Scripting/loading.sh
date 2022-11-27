#!/usr/bin/env bash

loop_timer () {
echo -ne '#####                     (33%)\r'
sleep 0.5
echo -ne '#############             (66%)\r'
sleep 0.5
echo -ne '#######################   (100%)\r'
 echo -ne '\n'
}

loop_timer