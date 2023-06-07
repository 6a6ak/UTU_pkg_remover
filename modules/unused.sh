#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Perform automatic removal of unused packages
echo "Removing unused packages..."
sudo apt-get autoremove -y

echo "Process complete."
