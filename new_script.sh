# use: ./new_script <scriptname>
#!/bin/bash
# Usage: new_script <script_name>
# create new bash script in current directory, then open it in your editor

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

# create new script template
cat << EOF > "$scriptname"
#!/bin/bash

# Usage: $scriptname <required_arg> [<optional_arg>] [--optional-flag]
# brief description of the script's purpose

set -e
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
