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
    re2ml)
      . "$DIR/re2ml.sh"
      ;;
    rei2mli)
      . "$DIR/rei2mli.sh"
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
