#!/bin/bash

# cd into current directory in case script is run from another directory
cd $(dirname $0)

# Symlink these dot files to the ones in this repo 
printf "Setting up dot file symlinks...\n"

# For each dot file in dotfiles
for FILE in .[^.]*; do
	
    # Do not symlink this repo's .git file
    if [[ $FILE == ".git" ]]; then
        continue
    fi	    

    # If it exists in ~/ already
    if [[ -f ~/$FILE || -d ~/$FILE ]]; then
        # Show warning for files about to get overwritten
        if [[ -f ~/$FILE ]]; then
            echo -e "\n  \e[33m~/${FILE} exists.\e[0m"
            echo -e "  \e[33mConsider running: diff ~/${FILE} ~/dot-files/${FILE}\e[0m"
            read -p "  Overwrite ~/${FILE}/? y/n: " yn
        fi
        
        # Show warning for directories about to get overwritten
        if [[ -d ~/$FILE ]]; then
            echo -e "\n  \e[33m~/${FILE}/ exists, and is a directory.\e[0m"
            echo -e "  \e[33m~/Make sure file you wan to keep from ~/${FILE}/ is in ~/dot-files/${FILE}/ otherwise you are about to lose them!/\e[0m"
            read -p "  Overwrite ~/${FILE}? y/n: " yn
        fi

        if [[ $yn == "y" ]]; then
            rm -r ~/$FILE && ln -s ~/dot-files/$FILE ~/$FILE
            echo -e "  \e[32mSymlinked: ~/${FILE} -> ~/dot-files/${FILE}\e[0m"
        else
            echo -e "  \e[32mSkipping file...\e[0m"
        fi
    else
        ln -s ~/dot-files/$FILE ~/$FILE
        echo -e "  \e[32mSymlinked: ~/${FILE} -> ~/dot-files/${FILE}\e[0m"
    fi
done

printf "\nIncluding dotfiles in your ~/.bashrc...\n"

# if the below block is already in .bashrc
if [[ $(cat ~/.bashrc | grep dot-files) ]]; then
    echo -e "\n  \e[32mYour aliases and bashrc customizations are already included in your ~/.bashrc.\e[0m"
    echo -e "  \e[32mNo action taken.\e[0m"

# else include the below block in .bashrc
else
    cat >> ~/.bashrc <<'endmsg'

# Load .bashrc customizations and aliases
if [ -f ~/dot-files/includes/include ]; then
   . ~/dot-files/includes/include
fi

endmsg

    echo -e "\n  \e[32mAdded include for ~/dot-files/includes/include in your ~/.bashrc.\e[0m"
    echo -e "  \e[32mAliases and bash customizations loaded.\e[0m"
fi 

printf "\nNext Steps: \n"
printf "\n  - Refresh bash: . ~/.bashrc"
printf "\n  - View aliases: a\n"
