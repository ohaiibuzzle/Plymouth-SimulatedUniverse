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

# Ask the user to select the 1080p or 4K variant
echo "Which variant would you like to install?"
echo "1. 1080p"
echo "2. 4K"

read -p "> " variant

if [ "$variant" == "1" ]; then
    echo "Installing 1080p variant..."
    cp -r SimulatedUniverse /usr/share/plymouth/themes/SimulatedUniverse
elif [ "$variant" == "2" ]; then
    echo "Installing 4K variant..."
    cp -r SimulatedUniverse-4k /usr/share/plymouth/themes/SimulatedUniverse
else
    echo "Invalid option. Please try again."
    exit
fi

# Prompt for theme selection
echo 'Please run "sudo plymouth-set-default-theme SimulatedUniverse" to set the theme.'