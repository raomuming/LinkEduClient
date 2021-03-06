#!/bin/bash

BASE_DIR=`dirname $0`/../..

DJINNI_FOLDER="$BASE_DIR/tools/djinni"
PROJECT_DIR="$BASE_DIR/AriCore"
IDL_FILE="$PROJECT_DIR/djinni/app.djinni"

TEMP_CPP_OUTPUT_FOLDER="$PROJECT_DIR/temp/cpp/gen"
TEMP_JNI_OUTPUT_FOLDER="$PROJECT_DIR/temp/android/jni"
TEMP_JAVA_OUTPUT_FOLDER="$PROJECT_DIR/temp/android/com.linkedu.core"
TEMP_OBJC_OUTPUT_FOLDER="$PROJECT_DIR/temp/ios/gen"

CPP_OUTPUT_FOLDER="$PROJECT_DIR/Api"
JNI_OUTPUT_FOLDER="$PROJECT_DIR/platform/android/libaricore/src/main"
JAVA_OUTPUT_FOLDER="$PROJECT_DIR/platform/android/libaricore/src/main/java"
OBJC_OUTPUT_FOLDER="$PROJECT_DIR/Objc"

rm -rf "$PROJECT_DIR/temp"

mkdir -p $CPP_OUTPUT_FOLDER
mkdir -p $JNI_OUTPUT_FOLDER
mkdir -p $JAVA_OUTPUT_FOLDER
mkdir -p $OBJC_OUTPUT_FOLDER

$DJINNI_FOLDER/src/run \
    --cpp-out $TEMP_CPP_OUTPUT_FOLDER \
    --cpp-namespace ari \
    --cpp-optional-header "<optional.hpp>" \
    --cpp-optional-template std::experimental::optional \
    --jni-include-cpp-prefix ../../../../../../src/gen/ \
    --ident-cpp-type FooBar \
    --ident-cpp-method fooBar \
    --ident-cpp-field fooBar \
    \
    --java-out $TEMP_JAVA_OUTPUT_FOLDER \
    --java-package com.linkedu.core \
    --ident-java-field fooBar \
    \
    --jni-out $TEMP_JNI_OUTPUT_FOLDER \
    \
    --objc-out $TEMP_OBJC_OUTPUT_FOLDER \
    --objcpp-out $TEMP_OBJC_OUTPUT_FOLDER \
    --objc-type-prefix Ari \
    \
    --idl $IDL_FILE

rsync -rlpgoD --delete --checksum --itemize-changes $TEMP_CPP_OUTPUT_FOLDER $CPP_OUTPUT_FOLDER 
rsync -rlpgoD --delete --checksum --itemize-changes $TEMP_JNI_OUTPUT_FOLDER $JNI_OUTPUT_FOLDER 
rsync -rlpgoD --delete --checksum --itemize-changes $TEMP_JAVA_OUTPUT_FOLDER $JAVA_OUTPUT_FOLDER
rsync -rlpgoD --delete --checksum --itemize-changes $TEMP_OBJC_OUTPUT_FOLDER $OBJC_OUTPUT_FOLDER

rm -rf "$PROJECT_DIR/temp"

echo "remove all.h......"
rm -rf "$OBJC_OUTPUT_FOLDER/all.h"

IMPORT="#import \""
DOBULE_QUOTE="\"" 

echo "export to all.h......"

echo "// AUTOGENERATED FILE - DO NOT MODIFY!" >> $OBJC_OUTPUT_FOLDER/all.h
echo "// This file generated by Djinni from!" >> $OBJC_OUTPUT_FOLDER/all.h
echo "" >> $OBJC_OUTPUT_FOLDER/all.h
for filename in $OBJC_OUTPUT_FOLDER/gen/*.h
do
	if [[ $filename != *"+Private"* ]]
	then
 	 	echo $IMPORT`basename "$filename"`$DOBULE_QUOTE >> $OBJC_OUTPUT_FOLDER/all.h;
	fi
done