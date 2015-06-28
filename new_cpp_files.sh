#!/bin/bash
# Usage: new_cpp_files <filename>
# create new C++ header and implementation files, then open them in your editor

set -e

# check that a filename was passed
[ $1 ] || (echo "No filename given!" && exit 1)
filename="$1"
header="${filename}.hh"
implementation="${filename}.cc"

# check if files of same name already exist
[ -e $header ] && (echo "File $header already exists!" && exit 1)
[ -e $implementation ] && (echo "File $implementation already exists!" && exit 1)

# create header file
cat << EOF > "$header"
#if !defined __${filename}_hh__
#define __${filename}_hh__


namespace $filename {

using namespace std;


} // namespace $filename


#endif
EOF

# create implementation file
cat << EOF > "$implementation"
#include "$header"


namespace $filename {

using namespace std;


} // namespace $filename
EOF

# open new files in editor
if [[ $EDITOR ]]; then
  $EDITOR "$header" "$implementation"
else
  echo "Created $header; editor not opened b/c \$EDITOR not set"
fi

exit 0
