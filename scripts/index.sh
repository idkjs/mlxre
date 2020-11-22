#!/bin/sh


DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/options.sh"
while [ -n "$1" ]; do # while loop starts
    
    case "$1" in
        
        ml2re) . "$DIR/ml2re.sh"
        ;; # Message for -a option
        
        mli2rei)
            # var=$(pwd)
            # echo "The current working directory $var."
            # list="$(find . -name \*.mli)"
            # echo ".mli files are $list."
        . "$DIR/mli2rei.sh";; # Message for -b option
        
        del) . "$DIR/delete.sh";;
        
        *) . "$DIR/options.sh" ;; # In case you typed a different option other than ml2re,mli2rei,del
        # *) echo "Option $1 not recognized" ;; # In case you typed a different option other than ml2re,mli2rei,del
        
    esac
    
    shift
    
done