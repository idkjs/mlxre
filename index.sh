#!/bin/sh

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

if [ $# -ge 1 ]
then
    while [ -n "$1" ]; do # while loop starts
        
        case "$1" in
            
            ml2re) . "$DIR/scripts/ml2re.sh";;
            
            mli2rei) . "$DIR/scripts/mli2rei.sh";;
            
            re2ml) . "$DIR/scripts/re2ml.sh";;
            
            rei2mli) . "$DIR/scripts/rei2mli.sh";;
            
            delete) . "$DIR/scripts/delete.sh";;
            
            *) echo "Invalid option. Options are mli2rei, rei2mli, ml2re, re2ml, delete or quit to exit"
            . "$DIR/scripts/options.sh";;
            
        esac
        
        shift
        
    done
else
    . "$DIR/scripts/options.sh"
fi