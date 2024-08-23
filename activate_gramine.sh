#!/usr/bin/env bash

if [ -z "$1" ]
then
  build_mode="debugoptimized"
  echo "No build mode given. Defaulting to debugoptimized"
else
  build_mode="$1"
fi

prefix="$HOME/gramine-bin/$build_mode"

if [ ! -d "$prefix" ]; then
  echo "$prefix does not exist. Aborting"
  exit
fi

if [ ! -d "$prefix/bin" ]; then
  echo "$prefix does not probably not contain a gramine build. Aborting"
  exit
fi

export PATH=$prefix/bin:$PATH
export PYTHONPATH=$prefix/lib/python3.10/site-packages:$PYTHONPATH
export PKG_CONFIG_PATH=$prefix/lib/x86_64-linux-gnu/pkgconfig:PKG_CONFIG_PATH
