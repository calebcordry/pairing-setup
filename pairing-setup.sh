#! /bin/bash

# install macOS package manager in a location that allows us to install add'l packages without sudo access
mkdir $HOME/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
export BREWDIR=$HOME/homebrew
export BREWBINDIR=$BREWDIR/bin
export BREWBIN=$BREWBINDIR/brew

# configure cask to install applications in our home directory
export APPDIR=$HOME/Desktop/Applications
export HOMEBREW_CASK_OPTS="--appdir=$APPDIR"
mkdir -p $APPDIR

# install and run Dash, great developer reference app
$BREWBIN cask install dash
open $APPDIR/Dash.app

# install pomander
curl -s https://raw.githubusercontent.com/reactorcore/pomander/master/bin/install | bash

# update sublime settings, using jq (command-line JSON manipulator)
export SUBLIMESETTINGS=$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
$BREWBIN install jq
$BREWBINDIR/jq '.tab_size = 2 | .translate_tabs_to_spaces = true' "$SUBLIMESETTINGS" > "$SUBLIMESETTINGS"
