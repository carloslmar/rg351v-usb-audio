#!/bin/bash
# Define the source and destination file paths
source_file="/etc/adio/usb.conf"
destination_file="/etc/asound.conf"
# Copy the source file to the destination
sudo cp "${source_file}" "${destination_file}"
systemctl --user restart pulseaudio