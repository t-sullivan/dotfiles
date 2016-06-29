#!/usr/bin/env bash

# Change shell to Zsh
chsh -s $(which zsh)

# Download and install 'Oh My Zsh'.
bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Load the shell dotfiles, and then some:
for file in ~/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
