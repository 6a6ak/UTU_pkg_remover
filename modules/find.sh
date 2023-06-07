#!/bin/bash

# Get a keyword to search for
read -p "Enter a keyword to search for a package or software: " search_keyword

echo "Searching for packages related to \"$search_keyword\"..."

# Use apt-cache search to find packages related to the keyword
apt-cache search "$search_keyword"
