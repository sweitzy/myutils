#/bin/bash

# $Id: commit.sh,v 1.1 2026/01/04 04:29:05 scott Exp scott $

# commit -- commit a file to both RCS and git

# Most people would frown on how I use RCS and git concurrently, I
# just want github green squares! :-)

MSG="$1"
shift

# Check if file is already in RCS, if not add it to RCS, and assume we
# have to add to git as well.
for file in "$*"; do

    # Error check if file exists
    if [ ! -e "$file" ]; then
	echo "File $file does not exist."
	exit 1
    fi

    if [ ! -e RCS/$file,v ]; then
	echo "Adding $file to RCS and git."
    else
	echo "Updating $file in RCS and git."
    fi
done
exit 0


    

ci -l -m"$MSG" $*
git commit -m"$MSG" $*
git push

exit 0
