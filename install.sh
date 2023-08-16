#!/bin/bash

# Test for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Copy the theme to /usr/share/plymouth/themes/
if [ -d "/usr/share/plymouth/themes/SimulatedUniverse" ]; then
    echo "Removing old theme..."
    rm -rf /usr/share/plymouth/themes/SimulatedUniverse
fi
cp -r ./SimulatedUniverse /usr/share/plymouth/themes/

# Prompt for theme selection
echo 'Please run "sudo plymouth-set-default-theme SimulatedUniverse" to set the theme.'