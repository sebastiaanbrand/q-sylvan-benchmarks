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

# get Quasimodo dependencies
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
export CPLUS_INCLUDE_PATH="$BOOST_PATH:$CPLUS_INCLUDE_PATH"
export PYTHON_INCLUDE=`python -c "from sysconfig import get_paths as gp; print(gp()[\"include\"])"`


# compile Quasimodo
cd tools/Quasimodo/cflobdd/cudd-complex-big/
autoupdate
autoreconf
sed -i 's/: ${CFLAGS="-Wall -Wextra -g -O3"}/: ${CFLAGS="-Wall -Wextra -g -O3 -fPIC"}/g' configure
sed -i 's/: ${CXXFLAGS="-Wall -Wextra -std=c++0x -g -O3"}/: ${CXXFLAGS="-Wall -Wextra -std=c++0x -g -O3 -fPIC"}/g' configure
./configure
make
cd ../..
cd python_pkg/
PYTHON_MINOR_VERSION=`python -c "import sys; print(sys.version_info[1]);"`
sed -i "s/python3.9/python3.$PYTHON_MINOR_VERSION/" tasks.py # change to current version
invoke build-quasimodo
invoke build-pybind11
cd ../../..
cp tools/quasimodo_qasm.py tools/Quasimodo/python_pkg/quasimodo_qasm.py
