DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

PS3="Select the operation: "

select opt in ml2re mli2rei delete quit; do

  case $opt in
    ml2re)
      . "$DIR/ml2re.sh"
      ;;
    mli2rei)
      . "$DIR/mli2rei.sh"
      ;;
    delete)
   . "$DIR/delete.sh"
      ;;
    quit)
      break
      ;;
    *) 
      echo "Invalid option $REPLY"
      ;;
  esac
done

# calculate () {
#   read -p "Enter the first number: " n1
#   read -p "Enter the second number: " n2
#   echo "$n1 $1 $n2 = " $(bc -l <<< "$n1$1$n2")
# }

# PS3="Select the operation: "

# select opt in add subtract multiply divide quit; do

#   case $opt in
#     add)
#       calculate "+";;
#     subtract)
#       calculate "-";;
#     multiply)
#       calculate "*";;
#     divide)
#       calculate "/";;
#     quit)
#       break;;
#     *) 
#       echo "Invalid option $REPLY";;
#   esac
# done
