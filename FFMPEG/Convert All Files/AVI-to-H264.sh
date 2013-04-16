#!/bin/bash

for i in *.avi
do

ffmpeg -i "$i" -vcodec libx264 -threads 10 -acodec libfaac "$i.mp4"

sleep 10

done
