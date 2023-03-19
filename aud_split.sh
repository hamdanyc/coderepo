!#/usr/bin/bash

TS="00:25:00"
AUD="$1.mp4"
ffmpeg -ss 00:00:00 -i $AUD -t $TS "aud_out/$1_part1.m4a"
ffmpeg -ss $TS -i $AUD "aud_out/$1_part2.m4a"
