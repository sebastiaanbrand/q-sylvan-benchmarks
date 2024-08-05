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

# compile MQT DDSIM
cd tools/mqt-ddsim
if [[ $recompile ]]; then rm -r -f build; fi
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
cd ../..

# get Quasimode dependencies
if [ ! -d tools/_deps/boost_1_81_0 ]; then
  mkdir -p tools/_deps/
  cd tools/_deps/
  if [ ! -f boost_1_81_0.tar.gz ]; then
    wget https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.tar.gz
  fi
  tar -xf boost_1_81_0.tar.gz
  cd ../..
fi
export BOOST_PATH="$PWD/tools/_deps/boost_1_81_0"
export PYTHON_INCLUDE="$PWD/.venv/include"


# compile Quasimodo
cd tools/Quasimodo/cflobdd/cudd-complex-big/
autoupdate
autoreconf
# "Edit configure to add -fPIC flag to CFLAGS and CXXFlAGS and then run the following after saving the file"
# ^ ?
./configure
make
cd ../..
cd python_pkg/
invoke build-quasimodo
invoke build-pybind11
cd ../../../
