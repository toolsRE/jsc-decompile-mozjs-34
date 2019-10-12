#!/bin/bash
function getdir(){
    for element in `ls $1`
    do  
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then 
            getdir $dir_or_file
        else
            if [ "${dir_or_file##*.}" = "jsc" ]
            then
                echo "$dir_or_file"
                php release/jsc2js.phar "$dir_or_file" > "$dir_or_file.jsc2js.txt"
                php release/jsc-byte.phar "$dir_or_file" > "$dir_or_file.jsc-byte.txt"
            fi
        fi  
    done
}
root_dir="$1"
getdir $root_dir