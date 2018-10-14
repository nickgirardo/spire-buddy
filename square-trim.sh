#!/bin/bash

# Takes a directory full of images and trims them to squares

if   [ -d "$1" ]
    then cd "$1";
else
    echo "Please pass in a valid directory";
    exit 1
fi

for f in *.png
do
    width=`convert $f -trim -format "%w" info:`
    height=`convert $f -trim -format "%h" info:`
    max=$(( width > height ? width : height ))

    convert $f -set filename:orig %t -trim -background None -gravity center -resize ${max}x${max} -extent ${max}x${max} %[filename:orig].png

    echo Trimmed $f to ${max}x${max}
done
