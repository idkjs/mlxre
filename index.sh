#!/bin/sh

PWD=$(pwd)


deleteML() {
    find . -type f -name '*.mli' -print -delete
    find . -type f -name '*.ml' -print -delete
};
deleteRE() {
    find . -type f -name '*.rei' -print -delete
    find . -type f -name '*.re' -print -delete
};


ml2re() {
    ext=("ml")
    from=(".ml");
    to=(".re");
    shopt -s nullglob
    # Check for file
    for ext in $ext; do
        files=( *."$ext" )
        printf 'number of %s files: %d\n' "$ext" "${#files[@]}"
        if (( ${#files[@]} )); then
            echo "Found these $from files:"
            printf "%s\n" "${files[@]}"
            find . -name $from| while read filename; do bsrefmt --parse $from --print $to $filename >${filename%.$from}.$to; done
            
        else
            echo 👎"${RED}Oops, no $from files found 👎\n"
            break
        fi
        
    done
    
    # Print out result
    for ext in ml; do
        files=( *."$ext" )
        printf 'number of %s files: %d\n' "$ext" "${#files[@]}"
        if (( ${#files[@]} )); then
            echo "New $to files:"
            printf "%s\n" "${files[@]}"
            
        else
            echo 👎"${RED}Oops, no $from files found 👎\n"
            break
        fi
        
    done    
}

re2ml() {
    ext=("re")
    ml=("ml")
    from=(".re");
    to=(".ml");
    shopt -s nullglob
    # Check for file
    for ext in $ext; do
        files=( *."$ext" )
        printf 'number of %s files: %d\n' "$ext" "${#files[@]}"
        if (( ${#files[@]} )); then
            echo "Found these $from files:"
            printf "%s\n" "${files[@]}"
            find . -name $from| while read filename; do bsrefmt --parse $from --print $to $filename >${filename%.$from}.$to; done
            
        else
            echo "Oops, no $from files found"
            break
        fi
        
    done
    
    # Print out result
    ext=("ml")
    for ext in ml; do
        files=( *."$ext" )
        printf 'number of %s files: %d\n' "$ext" "${#files[@]}"
        if (( ${#files[@]} )); then
            echo "New $ml files:"
            printf "%s\n" "${files[@]}"
            
        else
            echo "Oops, no $from files found"
            break
        fi
        
    done    
}

mli2rei() {
    ext=("mli")
    from=(".mli");
    to=(".rei");
    shopt -s nullglob
    # Check for file
    for ext in $ext; do
        files=( *."$ext" )
        printf 'number of %s files: %d\n' "$ext" "${#files[@]}"
        if (( ${#files[@]} )); then
            echo "Found these $from files:"
            printf "%s\n" "${files[@]}"
            find . -name $from| while read filename; do bsrefmt --parse $from --print $to $filename >${filename%.$from}.$to; done
            
        else
            echo "Oops, no $from files found"
            break
        fi
        
    done
    
    # Print out result
    for ext in ml; do
        files=( *."$ext" )
        printf 'number of %s files: %d\n' "$ext" "${#files[@]}"
        if (( ${#files[@]} )); then
            echo "New $to files:"
            printf "%s\n" "${files[@]}"
            
        else
            echo "Oops, no $from files found"
            break
        fi
        
    done
}

rei2mli() {
    ext=("rei")
    from=(".rei");
    to=(".mli");
    shopt -s nullglob
    # Check for file
    for ext in $ext; do
        files=( *."$ext" )
        printf 'number of %s files: %d\n' "$ext" "${#files[@]}"
        if (( ${#files[@]} )); then
            echo "Found these $from files:"
            printf "%s\n" "${files[@]}"
            find . -name $from| while read filename; do bsrefmt --parse $from --print $to $filename >${filename%.$from}.$to; done
            
        else
            echo "Oops, no $from files found"
            break
        fi
        
    done
    
    # Print out result
    for ext in ml; do
        files=( *."$ext" )
        printf 'number of %s files: %d\n' "$ext" "${#files[@]}"
        if (( ${#files[@]} )); then
            echo "New $to files:"
            printf "%s\n" "${files[@]}"
            
        else
            echo "Oops, no $from files found"
            break
        fi
        
    done
    
}

options() {
    
    PS3="Select the operation: "
    
    select opt in ml2re re2ml mli2rei rei2mli deleteML deleteRE quit; do
        
        case $opt in
            ml2re) ml2re
            ;;
            mli2rei) mli2rei
            ;;
            re2ml) re2ml
            ;;
            rei2mli) rei2mli
            ;;
            deleteML) deleteML
            ;;
            deleteRE) deleteRE
            ;;
            quit)
                break
            ;;
            *)
                echo "Invalid option $REPLY. Enter 6 to quit"
            ;;
        esac
    done
}



if [ $# -ge 1 ]; then
    while [ -n "$1" ]; do # while loop starts
        
        case "$1" in
            
            ml2re)
                echo "Converts .ml file to .re syntax"
            ml2re;;
            
            mli2rei)
                echo "Converts .mli file to .rei syntax"
            mli2rei;;
            
            re2ml)
                echo "Converts .re file to .ml syntax"
            re2ml;;
            
            rei2mli)
                echo "Converts .rei file to .mli syntax"
            rei2mli;;
            
            deleteML)
                echo "Deletes .ml/.mli files. Only use after you are finished converting to .re/.rei"
            deleteML;;
            
            deleteRE)
                echo "Deletes .re/.rei files. Only use after you are finished converting to .ml/.mli"
                
            deleteRE;;
            
            *) echo "Invalid option. Options are mli2rei, rei2mli, ml2re, re2ml, deleteML,deleteRE or quit to exit"
            options;;
            
        esac
        
        shift
    done
else
    options
fi
