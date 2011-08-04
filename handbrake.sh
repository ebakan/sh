#!/bin/bash

IFS=$'\n'

handbrake () {
    for i in $(ls $1); do
	HandBrakeCLI -i $1/$i -o $2/${i%.*}.mp4 --preset="High Profile" --subtitle 1 --subtitle-burn 1
#HandBrakeCLI -i $1/$i -o $2/${i%.*}.mp4 -X 480 -Y 360
    done
}

purify () {
    for i in $(ls $1); do
        mv $1/$i $1/${i//!/\\e}
    done
}

depurify () {
    for i in $(ls $1); do
        mv $1/$i $1/${i//\\e/!}
    done
}

purify $1
handbrake $1 $2
depurify $1
depurify $2
afplay /System/Library/Sounds/Glass.aiff
