# template fcn for printing user instructions
useage() {
  cat <<END
script_name [ -switch] arg

instructions
  -switch: explanation

END
}


# template fcn for reporting errors to user
# arg: message to print
error() {
  echo "Error: $1"
  useage
} >&2
