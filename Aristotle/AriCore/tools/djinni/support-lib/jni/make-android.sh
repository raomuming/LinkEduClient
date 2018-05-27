#!/bin/bash

BUILD_PATH="build"
LIB_PATH="lib"
COMMON_ARGS="NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk NDK_APPLICATION_MK=./Application.mk NDK_OUT=$BUILD_PATH V=1 " 

ndk-build $COMMON_ARGS  clean 

ndk-build $COMMON_ARGS  NDK_DEBUG=0

rm -rf $LIB_PATH
mkdir -p $LIB_PATH
rsync -rpgo --delete  --exclude 'objs' $BUILD_PATH/local/ $LIB_PATH
rm  -rf $BUILD_PATH
