#!/bin/bash

# Prompt the user to enter the date after which they want to see installed packages.
# They should enter the date in the format YYYY-MM-DD.
read -p "Enter the date (YYYY-MM-DD): " USER_DATE

# Convert the user's date to seconds since the Unix epoch for easy comparison.
USER_DATE_S=$(date --date="$USER_DATE" +%s)

# List the installed packages
echo "Packages installed after $USER_DATE:"

# Parse the history.log file
grep -A1 "Start-Date: " /var/log/apt/history.log | 
while read -r line
do
    if [[ $line == Start-Date* ]]; then
        PACKAGE_DATE=$(echo $line | cut -d' ' -f2-3)
        PACKAGE_DATE_S=$(date --date="$PACKAGE_DATE" +%s)
        # Continue to the next iteration if the package was installed before the user's date
        if (( PACKAGE_DATE_S < USER_DATE_S )); then
            continue
        fi
    elif [[ $line == Commandline* ]]; then
        PACKAGE_NAME=$(echo $line | grep -oP 'install \K.*')
        echo "$PACKAGE_DATE $PACKAGE_NAME"
    fi
done | sort
