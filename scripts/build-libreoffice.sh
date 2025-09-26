#!/bin/bash
set -e

export PATH=$ANDROID_NDK/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

cd $LIBO_ROOT

# Cross compile için autogen.input oluştur
cat <<EOF > autogen.input
--with-distro=CPAndroidAarch64
--build=x86_64-unknown-linux-gnu
--host=aarch64-linux-android
--with-android-ndk=$ANDROID_NDK
--with-android-sdk=$ANDROID_SDK
--enable-sal-log
--enable-debug
EOF

./autogen.sh
make -j$(nproc)
