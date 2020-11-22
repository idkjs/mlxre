#!/bin/sh
  var=$(pwd)
echo "The curremlnt working directory $var."
list="$(find . -name \*.ml)"
echo ".ml files are $list."
# find . -name "*.mli"| while read filename; do bsrefmt --parse mli --print rei $filename >${filename%.mli}.re; done

  find . -name "*.mli" | while read -r filename; do bsrefmt --parse ml --print re "$filename" >"${filename%.mli}.rei"; done