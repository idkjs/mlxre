#!/bin/sh
var=$(pwd)
echo "The curremlnt working directory $var."
list="$(find . -name \*.mli)"
echo ".mli files are $list."


find . -name "*.mli" | while read -r filename; do bsrefmt --parse ml --print re "$filename" >"${filename%.mli}.rei"; done

list="$(find . -name \*.rei)"
echo "new .rei files are $list."