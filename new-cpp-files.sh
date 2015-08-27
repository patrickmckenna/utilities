#!/bin/bash
# Usage: new_cpp_files <filename>
# create new C++ header, implementation, and build files, then open them in your editor

set -e

# check that a filename was passed
[ $1 ] || (echo "No filename given!" && exit 1)
filename="$1"
header="${filename}.hh"
implementation="${filename}.cc"
build_file="SConstruct"

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


# create build file
cat << EOF > "build_file"
cxx_flags = Split('''-std=c++1y
                     -Wno-c++98-compat
                     -O0
                     -g
                     -fcolor-diagnostics''')
build_env = Environment(CXXFLAGS = cxx_flags)
build_env.Program(source = "$implementation")
EOF


# open new files in editor
if [[ $EDITOR ]]; then
  $EDITOR "$header" "$implementation" "build_file"
else
  echo "Created $header; editor not opened b/c \$EDITOR not set"
fi

exit 0
