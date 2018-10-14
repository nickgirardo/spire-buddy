#!/bin/bash

if [ ! -d "$1" ]; then
    echo "Please pass in a valid directory";
    exit 1
fi

OUT_DIR="relics"

# If we've already got a directory called "relics" we find a name not taken
if [ -d "$OUT_DIR" ]; then
    # Increment $N as long as a directory with that name exists
    N=1
    while [[ -d "$OUT_DIR-$N" ]] ; do
        N=$(($N+1))
    done

    OUT_DIR="$OUT_DIR-$N"
fi

# We've already made sure this directory doesn't exist
mkdir "$OUT_DIR"

# Copy over all images which are not popups
for f in "$1"/*.png
do
    if [[ $f != *-popup* ]]; then
        cp "$f" "$OUT_DIR"
    fi
done

# Finally, trim all copied images
./square-trim.sh $OUT_DIR

echo "Output images to $OUT_DIR"
