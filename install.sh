#!/bin/bash

if [ $USER != 'root' ]; then
  echo 'You should run it as root.'
else
  mkdir ~/.grub
  cp /build ~/.grub
  sed -i 's/^GRUB_THEME=".*"$/GRUB_THEME="\/home\/'$SUDO_USER'\/.grub\/grub-minimal\/theme.txt"/g' build/test
  update grub
fi