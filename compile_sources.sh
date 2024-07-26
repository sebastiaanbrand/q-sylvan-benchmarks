#!/bin/bash

while getopts "rq" opt; do
  case $opt in
    r) recompile=true
    ;;
    q) only_qsylvan=true
    ;;
    \?) echo "Invalid option -$OPTARG" >&1; exit 1;
    ;;
  esac
done

# (re)compile Q-Sylvan
cd tools/q-sylvan
if [[ $recompile ]]; then rm -r -f build; fi
mkdir -p build
cd build
cmake ..
make
cd ../../..
if [[ $only_qsylvan ]]; then exit 0; fi


# compile GPMC (required for Quokka-Sharp)
cd tools/quokka-sharp/GPMC
if [[ $recompile ]]; then rm -r -f build; fi
./build.sh r
cd ../../..

# compile MQT DDSIM (not recompiled with -r because it takes quite long)
cd tools/mqt-ddsim
if [[ $recompile ]]; then rm -r -f build; fi
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBINDINGS=ON -DBUILD_DDSIM_TESTS=ON
cmake --build build --config Release
cd ../../..
