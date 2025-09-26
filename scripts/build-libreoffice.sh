#!/bin/bash
set -e

export PATH=$ANDROID_NDK/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH
cd $LIBO_ROOT

# Cross compile için autogen.input benzeri parametreler
./autogen.sh \
  --host=aarch64-linux-android \
  --build=x86_64-unknown-linux-gnu \
  --with-android-ndk=$ANDROID_NDK \
  --with-android-api-level=21 \
  --enable-debug \
  --disable-poppler \
  --with-theme=colibre \
  --enable-sal-log

make -j$(nproc)
