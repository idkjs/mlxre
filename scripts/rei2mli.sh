#!/bin/sh
var=$(pwd)
echo "The current working directory $var."
list="$(find . -name \*.rei)"
echo ".rei files are $list."


find . -name "*.rei" | while read -r filename; do bsrefmt --parse re --print ml "$filename" >"${filename%.rei}.mli"; done

list="$(find . -name \*.mli)"
echo "new .mli files are $list."