#!/bin/bash

# List installed packages
echo "Installed Packages:"
apt list --installed | awk -F'/' '{print $1}'

# Prompt user for package selection
read -p "Enter the name of the package you want to remove: " package_name

# Check if the package is installed
if dpkg -s "$package_name" >/dev/null 2>&1; then
    echo "Package '$package_name' is installed. Removing..."
    # Remove the package
    sudo apt remove "$package_name"
    echo "Package '$package_name' has been removed."
else
    echo "Package '$package_name' is not installed."
fi
