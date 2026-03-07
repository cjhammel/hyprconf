#!/bin/bash

city=KDAA
cachedir=~/.cache/rbn
cachefile=${0##*/}-$1

if [ ! -d $cachedir ]; then
  mkdir -p $cachedir
fi

if [ ! -f $cachedir/$cachefile ]; then
  touch $cachedir/$cachefile
fi

# Save current IFS
SAVEIFS=$IFS
# Change IFS to new line.
IFS=$'\n'

cacheage=$(($(date +%s) - $(stat -c '%Y' "$cachedir/$cachefile")))
if [ $cacheage -gt 1740 ] || [ ! -s $cachedir/$cachefile ]; then
  data=($(curl -s https://en.wttr.in/"$city"?format=%m 2>&1))
fi

moon=($(cat $cachedir/$cachefile))

#echo ${weather[1]##*,}

echo $data 

