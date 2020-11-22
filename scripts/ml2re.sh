
#!/bin/sh

var=$(pwd)
echo "The curremlnt working directory $var."
list="$(find . -name \*.ml)"
echo ".ml files are $list."
find . -name "*.ml"| while read filename; do bsrefmt --parse ml --print re $filename >${filename%.ml}.re; done

list="$(find . -name \*.re)"
echo "new .re files are $list."