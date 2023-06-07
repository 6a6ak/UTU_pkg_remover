#!/bin/bash



while true; do


text="\e[1m                    Ubuntu Remover                \e[0m"
footer="\e[1m                                                \e[0m"
color="\e[44m"
width=$(tput cols)
padding=$((($width - ${#text}) ))
#tput cup 2 $padding
echo -ne "${color}${text}\033[0m\n"

echo 

    echo " Please select an option:"
    echo "  1. List all packages"
    echo "  2. List all programs"
    echo "  3. List packages installed after a certain date"
    echo "  4. Find a package name"
    echo "  5. Remove unused packages"
    echo "  6. Remove a package or software"
    echo "  0. Exit"
echo "_________________________________________________"
    read -p "  Your selection: " option

echo 
echo

    case $option in
        1)
            # List all packages
         echo "Packages list"
            bash ./modules/packages.sh
            ;;

        2)
            # List all programs
           echo "Programs list"
            bash ./modules/software.sh
            ;;


        3)
            # List packages installed after a certain date
     echo "List by date"
            bash ./modules/bydate.sh
            ;;

        4)
          #
           echo "Find a package name "
            bash ./modules/find.sh
            ;;

        5)
          #
           echo "Find a package name "
            bash ./modules/unused.sh
            ;; 
        6)
            # Remove a package or software
            read -p "Enter the name of the package or software you want to remove: " package_name
            sudo apt remove "$package_name"
            ;;
        0)
            # Exit the script
            echo "Exiting..."
            exit 0
            ;;

        *)
            echo "Invalid option. Please enter a number between 0 and 4."
            ;;
    esac
            
done