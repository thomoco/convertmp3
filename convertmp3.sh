#!/bin/bash -x
#
# convertmp3.sh
# thom o'connor
# 2015-08-29
# v0.1

input="$1"
output="$2"

if [ -z "${input}" -o -z "${output}" ];
then
 echo "Usage: convertmp3.sh [input-file] [output-directory]"
 exit 1
fi

# create final filename 
mydirname="`dirname \"${output}\"`"
myfilename="`basename \"${output}\"`"
mytype="`echo ${myfilename} | sed -e 's/^.*\.\([^.]*\)$/\1/;'`"
finalname="${myfilename%${mytype}}mp3"

# convert
echo "Converting $input to mp3..."
#ffmpeg -i "${input}" -ac 2 -f wav - | \
#  lame -V 0 - "${finaloutput}"

ffmpeg -i "${input}" -ac 2 -codec:a libmp3lame -qscale:a 0 "${mydirname}/${finalname}"

exit 0
