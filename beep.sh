#!/bin/bash

# $Id: beep.sh,v 1.3 2025/09/08 19:41:55 scott Exp scott $

# Initial version from ChatGPT: "write a bash script to beep the
# terminal every 10 seconds for 5 minutes"

if [ "$1" == "" -o "$2" == "" ]; then
    echo Usage: $0 count interval
    echo Example: $0 30 10
    exit 1
fi

COUNT=$1
DELAY=$2


echo COUNT $COUNT, DELAY $DELAY

for (( i=1; i<=$COUNT; i++ )); do
#for i in {1..30}
#do
    echo beep $i
    echo -ne '\a'  # Terminal bell character
    sleep $DELAY
done

# All done.
echo -ne '\a'  # Terminal bell character
echo -ne '\a'  # Terminal bell character
echo -ne '\a'  # Terminal bell character

exit 0
