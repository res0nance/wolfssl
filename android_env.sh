export APILEVEL=21

case $OSTYPE in
 darwin*)
   export TOOLCHAIN="${ANDROID_NDK_ROOT}/toolchains/llvm/prebuilt/darwin-x86_64/bin/"
   ;;
 linux*)
   export TOOLCHAIN="${ANDROID_NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64/bin/"
   ;;
esac

if [ -z "$1" ]; then
  echo "Android arch not provided!"
  exit 1
fi

case $1 in
 armeabi-v7a )
  export CHOST=armv7a-linux-androideabi
  ;;
 arm64-v8a )
  export CHOST=aarch64-linux-android
  ;;
 x86 )
  export CHOST=i686-linux-android
  ;;
 x86_64 )
  export CHOST=x86_64-linux-android
  ;;
esac

export API_PREFIX=${TOOLCHAIN}${CHOST}${APILEVEL}
export SYSROOT="${ANDROID_NDK_ROOT}/sysroot/"

export CFLAGS="-isystem ${SYSROOT}"
export CXXFLAGS="-isystem ${SYSROOT}"

export CPP="${API_PREFIX}-clang -E"
export CC="${API_PREFIX}-clang"
export CXX="${API_PREFIX}-clang++"
export LD="${TOOLCHAIN}ld"
export AS="${API_PREFIX}-as"
export AR="${TOOLCHAIN}llvm-ar"
export RANLIB="${TOOLCHAIN}llvm-ranlib"
export STRIP="${TOOLCHAIN}llvm-strip"
export OBJDUMP="${TOOLCHAIN}llvm-objdump"