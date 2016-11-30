#!/bin/bash

# install using pip from the whl file provided by Google

if [ `uname` == Darwin ]; then
    if [ "$PY_VER" == "2.7" ]; then
        pip install --no-deps https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-${PKG_VERSION}-py2-none-any.whl
    else
        pip install --no-deps https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-${PKG_VERSION}-py3-none-any.whl
    fi
fi

if [ `uname` == Linux ]; then
    rm -rf build
    mkdir -p build
    cd build

    export LIBRARY_PATH=$PREFIX/lib
    export INCLUDE_PATH=$PREFIX/include
    cmake \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DCMAKE_INCLUDE_PATH=$INCLUDE_PATH \
        -DCMAKE_LIBRARY_PATH=$LIBRARY_PATH \
        -DCMAKE_BUILD_TYPE=Release ../tensorflow/contrib/cmake
    make all
fi
