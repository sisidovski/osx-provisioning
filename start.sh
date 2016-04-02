#!/bin/sh

sudo xcodebuild -license
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update

brew install python
brew install ansible
brew tap caskroom/cask

if [ -e ~/.osx-provisioning ]; then
  mkdir ~/.osx-provisioning
fi

cd ~/.osx-provisioning/

echo 'localhost' > hosts

HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook -i hosts -vv localhost.yml
