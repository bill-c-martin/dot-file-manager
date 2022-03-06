#!/bin/bash

# Symlink these dot files to the ones in this repo 
printf "# Setting up dot file symlinks..\n"

# For each dot file in dotfiles
for FILE in .[^.]*; do
	
    if [[ $FILE == ".git" ]]; then
        continue
    fi	    

    # If it exists in ~/ already
    if [[ -f ~/$FILE ]]; then
        printf "\n~/${FILE} exists.\n"
        printf "Consider running: diff ~/${FILE} ~/dot-files/${FILE}\n"
        read -p "Overwrite ~/${FILE}? y/n: " yn

        if [[ $yn == "y" ]]; then
            rm ~/$FILE && ln -s ~/dot-files/$FILE ~/$FILE
            printf "Symlinked: ~/${FILE} -> ~.dot-files/${FILE}\n"
        else
            printf "\nSkipping file..\n"
        fi
    else
        ln -s ~/dot-files/$FILE ~/$FILE
        printf "Symlinked: ~/${FILE} -> ~/dot-files/${FILE}\n"
    fi
done

printf "\n# Including dotfiles in your ~/.bashrc..."
if [[ $(cat ~/.bashrc | grep dot-files) ]]; then
    printf "\nThe dotfile include is already present in ~/.bashrc. No action taken.\n"
else
    cat >> ~/.bashrc <<'endmsg'

# Load .bashrc customizations and aliases
if [ -f ~/dot-files/includes/include ]; then
   . ~/dot-files/includes/include
fi

endmsg
    printf "\nAdded include for dotfile aliases/config in your ~/.bashrc\n"
fi 

printf "\n# Next Steps: \n"
printf "\n- Refresh bash: . ~/.bashrc"
printf "\n- View aliases: a\n"
