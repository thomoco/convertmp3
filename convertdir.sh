#!/bin/bash
#
# convertdir.sh
# thom o'connor
# 2015-08-29
# v0.1

SRCDIR="$1"
WORKDIR="$2"

if [ ! -d "${SRCDIR}" ];
 then
 echo "$SRCDIR missing, exiting"
 exit 1
fi

if [ ! -d "${WORKDIR}" ];
 then
 echo "$WORKDIR missing, exiting"
 exit 1
fi

# create dirs
cd "${SRCDIR}"
find . -type d -exec mkdir -m 1777 -p "${WORKDIR}/{}" \;

# convert
find . -type f -exec convertmp3.sh "{}" "${WORKDIR}/{}" \;

exit 0
