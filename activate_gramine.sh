#!/usr/bin/env bash

# This file must be used with "source bin/activate" *from bash*
# you cannot run it directly


if [ "${BASH_SOURCE-}" = "$0" ]; then
    echo "You must source this script: \$ source $0" >&2
    exit 33
fi

deactivate_gramine () {
    # reset old environment variables
    # ! [ -z ${VAR+_} ] returns true if VAR is declared at all
    if ! [ -z "${_OLD_VIRTUAL_PATH_GRAMINE:+_}" ] ; then
        PATH="$_OLD_VIRTUAL_PATH_GRAMINE"
        export PATH
        unset _OLD_VIRTUAL_PATH_GRAMINE
    fi
    if ! [ -z "${_OLD_VIRTUAL_PYTHONPATH_GRAMINE+_}" ] ; then
        PYTHONPATH="$_OLD_VIRTUAL_PYTHONPATH_GRAMINE"
        export PYTHONPATH
        unset _OLD_VIRTUAL_PYTHONPATH_GRAMINE
    fi
    if ! [ -z "${_OLD_VIRTUAL_PKG_CONFIG_PATH_GRAMINE+_}" ] ; then
        PKG_CONFIG_PATH="$_OLD_VIRTUAL_PKG_CONFIG_PATH_GRAMINE"
        export PKG_CONFIG_PATH
        unset _OLD_VIRTUAL_PKG_CONFIG_PATH_GRAMINE
    fi

    # The hash command must be called to get it to forget past
    # commands. Without forgetting past commands the $PATH changes
    # we made may not be respected
    hash -r 2>/dev/null
}

# unset irrelevant variables
deactivate_gramine nondestructive

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

_OLD_VIRTUAL_PATH_GRAMINE="$PATH"
PATH="$prefix/bin:$PATH"
export PATH

_OLD_VIRTUAL_PYTHONPATH_GRAMINE="$PYTHONPATH"
PYTHONPATH=$prefix/lib/python3.10/site-packages:$PYTHONPATH
export PYTHONPATH

_OLD_VIRTUAL_PKG_CONFIG_PATH_GRAMINE="$PKG_CONFIG_PATH"
PKG_CONFIG_PATH=$prefix/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH

# The hash command must be called to get it to forget past
# commands. Without forgetting past commands the $PATH changes
# we made may not be respected
hash -r 2>/dev/null
