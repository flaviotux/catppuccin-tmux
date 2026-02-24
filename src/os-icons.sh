#!/usr/bin/env bash

OS_ICON=""
if [[ $OSTYPE == "linux-gnu"* ]]; then
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
    ubuntu)
      OS_ICON=" "

      ;;
    fedora)
      OS_ICON=" "
      ;;
    arch)
      OS_ICON=" "

      ;;
    debian)
      OS_ICON=" "
      ;;
    centos)
      OS_ICON=" "
      ;;
    manjaro)
      OS_ICON=" "
      ;;
    alpine)
      OS_ICON=" "
      ;;
    kali)
      OS_ICON=" "
      ;;
    freebsd)
      OS_ICON=" "
      ;;
    opensuse)
      OS_ICON=" "
      ;;
    openbsd)
      OS_ICON=" "
      ;;
    *)
      OS_ICON=" "
      ;;
    esac
  else
    OS_ICON=" "
  fi
elif [[ $OSTYPE == "darwin"* ]]; then
  OS_ICON=" "
elif [[ $OSTYPE == "cygwin" || $OSTYPE == "msys" || $OSTYPE == "win32" ]]; then
  OS_ICON=" "
else
  OS_ICON=" "
fi

echo "$OS_ICON"
