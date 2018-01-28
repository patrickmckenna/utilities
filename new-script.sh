#!/bin/bash
#/ Usage: new-script name
#/
#/ Create new bash script in current directory, then open it in your editor
#/

set -e

# check that script_name given
if [[ ! $1 ]]; then
  echo "No filename given!"
  exit 1
fi
scriptname="$1"

# check if file of same name already exists
if  [[ -e $scriptname ]]; then
  echo "File $scriptname already exists!"
  exit 1
fi

# define template script
cat << EOF > "$scriptname"
#!/bin/bash
#/ Usage: $scriptname
#/
#/ Description
#/
#/ Examples:
#/
#/   $scriptname
#/

set -e

# use ENVIRONMENT if set, otherwise first arg passed, default to development
: ${ENVIRONMENT:=${1-"development"}}

# if help requested, print the comments at the top of the file
[ "\$1" = "--help" -o "\$1" = "-h" -o "\$1" = "help" ] && {
  grep "^#/" <"\$0"| cut -c4-
  exit 0
}

EOF

# make new file executable
chmod +x "$scriptname"

# open new file in editor
if [[ $EDITOR ]]; then
  $EDITOR "$scriptname"
else
  echo "Created ${scriptname}; editor not opened b/c \$EDITOR not set"
fi

exit 0
