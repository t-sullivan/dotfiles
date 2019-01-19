#! /usr/bin/env bash

# Install Brew
if test ! $(which brew)
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

brew install zsh
# Add zsh path to `/etc/shells`
sudo bash -c "which zsh >> /etc/shells"

# Install binaries
brew install git
brew install python3

# Install casks
brew tap caskroom/cask
brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install sublime-text
brew cask install visual-studio-code

brew cleanup

# Change shell to Zsh
chsh -s $(which zsh)