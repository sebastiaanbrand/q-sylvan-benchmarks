#!/bin/bash
compile_qsylvan=true
compile_mqt=true
compile_quokka=true
compile_quasimodo=true

while getopts "rqm" opt; do
  case $opt in
    r) recompile=true
    ;;
    q) compile_qsylvan=true;
       compile_mqt=false;
       compile_quokka=false;
       compile_quasimodo=false;
    ;;
    m) compile_qsylvan=false;
       compile_mqt=true;
       compile_quokka=false;
       compile_quasimodo=false;
    ;;
    \?) echo "Invalid option -$OPTARG" >&1; exit 1;
    ;;
  esac
done

# (re)compile Q-Sylvan
if $compile_qsylvan; then
  cd tools/q-sylvan
  if [[ $recompile ]]; then rm -r -f build; fi
  mkdir -p build
  cd build
  cmake ..
  make
  cd ../../..
fi;

if $compile_mqt; then
# compile MQT DDSIM
  cd tools/mqt-ddsim
  if [[ $recompile ]]; then rm -r -f build; fi
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
  cd ../..
fi

# compile GPMC (required for Quokka-Sharp)
if $compile_quokka; then
  cd tools/quokka-sharp/GPMC
  if [[ $recompile ]]; then rm -r -f build; fi
  ./build.sh r
  cd ../../..
fi

if $compile_quasimodo; then
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
fi
