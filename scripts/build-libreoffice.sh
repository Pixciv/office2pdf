#!/bin/bash
set -e

export PATH=$ANDROID_NDK/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

cd $LIBO_ROOT

# Cross compile için autogen.input benzeri parametreler
./autogen.sh \
  --host=aarch64-linux-android \
  --build=x86_64-unknown-linux-gnu \
  --with-android-ndk=$ANDROID_NDK \
  --with-android-sdk=$ANDROID_SDK \
  --enable-sal-log \
  --enable-debug \
  --without-export-validation \
  --without-helppack-integration \
  --without-junit \
  --with-theme=colibre \
  --disable-poppler \
  --disable-odk \
  --enable-android-lok \
  --with-android-api-level=21 \
  --with-android-package-name=com.collabora.libreoffice \
  --with-vendor=Collabora \
  --disable-scripting-beanshell \
  --disable-scripting-javascript \
  --with-lang=de,en-US,es,pt-BR \
  --with-myspell-dicts \
  --with-docrepair-fonts \
  --enable-pdfimport \
  --enable-release-build \
  --enable-option-checking=fatal

make -j$(nproc)
