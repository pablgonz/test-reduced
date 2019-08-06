#!/usr/bin/env sh
if ! command -v gs > /dev/null; then
  wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/ghostscript-9.27-linux-x86_64.tgz
  tar -xzf ghostscript-9.27-linux-x86_64.tgz
  cd ghostscript-9*
  ./configure --prefix=~/gs
  make 
  make install
  cd $TRAVIS_BUILD_DIR
fi
