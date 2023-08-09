#!/bin/bash

while getopts "r" opt; do
  case $opt in
    r) recompile=true
    ;;
    \?) echo "Invalid option -$OPTARG" >&1; exit 1;
    ;;
  esac
done

# (re)compile Q-Sylvan
cd extern/q-sylvan
if [[ $recompile ]]; then rm -r -f build; fi
mkdir -p build
cd build
cmake ..
make
cd ../../..


# compile MTQ DDSIM (not recompiled with -r because it takes quite long)
cd extern/mtq-ddsim
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBINDINGS=ON -DBUILD_DDSIM_TESTS=ON
cmake --build build --config Release
cd ../../..
