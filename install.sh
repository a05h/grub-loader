#!/bin/bash

if [ $USER != 'root' ]; then
  echo 'You should run it as root.'
else
  mkdir ~/.grub
  cp /build ~/.grub
  sed -i 's/^GRUB_THEME=".*"$/GRUB_THEME="/home/$USER/.grub/grub-minimal/theme.txt"/g' /etc/default/grub
  update grub
fi
