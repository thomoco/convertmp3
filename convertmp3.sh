#!/bin/bash
#
# convertmp3.sh
# thom o'connor
# 2015-08-29
# v0.1

input="$1"
output="$2"

finaloutput="${output}.mp3"

echo "Converting $input to mp3..."
ffmpeg -i "${input}" -ac 2 -f wav - | \
  lame -V 0 - "${finaloutput}"

exit 0
