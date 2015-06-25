#!/bin/bash
# Usage: new_cpp_files <filename>
# create new cpp file, then open it in your editor

set -e

# check that script_name given
if [[ ! $1 ]]; then
  echo "No filename given!"
  exit 1
fi
filename="$1"
header="${filename}.hh"
implementation="${filename}.cc"

# check if file of same name already exists
if  [[ -e $header ]]; then
  echo "File $header already exists!"
  exit 1
fi

# create new script template
cat << EOF > "$header"
#if !defined __${filename}_hh__
#define __${filename}_hh__


namespace {


} // namespace 


#endif
EOF

# create implementation file
cat << EOF > "$implementation"
#include "$header"


namespace {


} // namespace
EOF

# open new files in editor
if [[ $EDITOR ]]; then
  $EDITOR "$header" "$implementation"
else
  echo "Created $header; editor not opened b/c \$EDITOR not set"
fi

exit 0
