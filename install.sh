#!/bin/bash

if [ $USER != 'root' ]; then
  echo 'You should run it as root.'
else
  mkdir /home/$SUDO_USER/.grub
  mkdir /home/$SUDO_USER/.grub/grub-minimal
  cp grub-minimal/* /home/$SUDO_USER/.grub/grub-minimal
  if grep -xq '^GRUB_THEME=".*"$' /etc/default/grub; then
    sed -i 's/^GRUB_THEME=".*"$/GRUB_THEME="\/home\/'$SUDO_USER'\/.grub\/grub-minimal\/theme.txt"/g' /etc/default/grub
  else
    sed -i '$ a GRUB_THEME="/home/'$SUDO_USER'/.grub/grub-minimal/theme.txt"' /etc/default/grub
  fi
  update grub
  read -r -p "All done. Reboot now? [y/n] " res
  if [[ "$res" =~ ^(yes|y)$ ]]; then
    shutdown -r now
  fi
fi
