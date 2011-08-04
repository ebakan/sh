#!/bin/bash

#get the proper dir from either the command line or default to the current directory
dir=.;

if [ $# -ge 1 ]; then
dir=$1;
echo $1;
fi;

filecount=0;
linecount=0;
for i in `find $dir -name "*.cpp" -o -name "*.h"`; do
linecount=$(( $linecount + `wc -l $i | awk '{print $1}'` ));
filecount=$(( $filecount + 1));
done

echo $linecount lines in $filecount files
