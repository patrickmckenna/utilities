#!/bin/bash

# create new bash script in current directory, then open it in your editor
# use: ./new_script <scriptname>

# check that name given
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

# create new file with shebang
echo '#!/bin/bash' >> "$scriptname"
# make new file executable
chmod +x "$scriptname"
# open new file in editor
if [[ $EDITOR ]]; then
  $EDITOR "$scriptname"
else
  echo "Created ${scriptname}; editor not opened b/c \$EDITOR not set"
fi

exit 0
