
#!/bin/sh

var=$(pwd)
echo "The current working directory $var."
list="$(find . -name \*.re)"
echo ".re files are $list."
find . -name "*.re"| while read filename; do bsrefmt --parse re --print ml $filename >${filename%.re}.re; done


list="$(find . -name \*.ml)"
echo "new .ml files are $list."