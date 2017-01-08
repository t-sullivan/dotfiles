#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Check if Homebrew is installed. If not, install it.
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
# Add Bash path to `/etc/shells`.
sudo bash -c "which bash >> /etc/shells"
# Install zsh.
brew install zsh
# Add zsh path to `/etc/shells`.
sudo bash -c "which zsh >> /etc/shells"

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install video tools.
brew install ffmpeg
brew install mkvtoolnix

# Install other useful binaries.
brew install ack
brew install git
brew install imagemagick --with-webp
brew install python3
brew install p7zip
brew install tree

# Install casks.
brew tap caskroom/cask
brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install vlc
brew cask install osxfuse

# Remove outdated versions from the cellar.
brew cleanup
