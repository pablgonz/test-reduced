#!/usr/bin/env sh

# This script is used for building LaTeX files using Travis
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=../texlive/texlive.profile

  cd ..
fi

# l3build, LuaTeX, plain and (Xe|pdf)LaTeX formats .... 
tlmgr install luatex latex-bin tex xetex

# PKS
tlmgr install $(cat texlive/texlive_packages | grep -v -e '^[[:space:]]*$' -e '^#')
# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0
