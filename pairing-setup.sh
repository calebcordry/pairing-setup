#! /bin/bash

cd $HOME

# install macOS package manager in a location that allows us to install add'l packages without sudo access
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
export BREW=$HOME/homebrew
export BREWBIN=$BREW/bin

# install and run Dash, great developer reference app
$BREW cask install dash
$BREWBIN/Dash.app

# install pomander
curl -s https://raw.githubusercontent.com/reactorcore/pomander/master/bin/install | bash

# update sublime settings
$BREW install jq
# $BREWBIN/jq '' $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
# "tab_size": 2
# "tanslate_tabs_to_spaces": true




