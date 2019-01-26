#! /usr/bin/env bash

# Install Brew
if test ! $(which brew)
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update to latest Homebrew and upgrade any already-installed formulae
brew update
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

# Link subl
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# Set macOS settings
sudo bash -c "source .macos"

# Copy dotfiles
cp -R ./.colors ~/.colors
cp .macos ~/.macos
cp .zshrc ~/.zshrc


# Install oh-my-zsh
sudo bash -c "curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

# Change shell to Zsh
chsh -s $(which zsh)