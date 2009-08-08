#!/bin/bash

echo "Installing bashrc and dircolors into $HOME/.bashrc"
cp env/bashrc $HOME/.bashrc
cp env/dircolors $HOME/.dircolors

echo "Installing common utilities"
apt-get install -y man wget locate curl unzip

SAMBA_CONF=/etc/samba/smb.conf
if [ -f $SAMBA_CONF ]; then
  echo ""
  echo "** Don't forget to enable home directories in $SAMBA_CONF:"
  echo "    [homes]"
  echo "    read only = no"
fi


