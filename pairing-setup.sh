#! /bin/bash

# general setup
PAIRING_SETUP_URL="https://raw.githubusercontent.com/jhogan4288/pairing-setup/master"

# install macOS package manager in a location that allows us to install add'l packages without sudo access
BREW_DIR="$HOME/homebrew"
BREW_BIN_DIR="$BREW_DIR/bin"
BREW_BIN="$BREW_BIN_DIR/brew"
BREW_URL="https://github.com/Homebrew/brew/tarball/master"
mkdir "$BREW_DIR" && curl -L "$BREW_URL" | tar xz --strip 1 -C homebrew

# configure cask to install applications in our home directory (where we don't need sudo access)
APP_DIR="$HOME/Desktop/Applications"
export HOMEBREW_CASK_OPTS="--appdir=$APP_DIR"
mkdir -p "$APP_DIR"

# install and run Dash, great developer reference app
"$BREW_BIN" cask install dash
open "$APP_DIR"/Dash.app

# install pomander, HR style guide enforcement tool
POMANDER_INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/reactorcore/pomander/master/bin/install"
curl -s "$POMANDER_INSTALL_SCRIPT_URL" | bash

# update sublime user settings, using jq (command-line JSON manipulator)
SUBLIME_SETTINGS_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
SUBLIME_USER_SETTINGS="$SUBLIME_SETTINGS_DIR/Preferences.sublime-settings"
$BREW_BIN install jq
$BREW_BIN_DIR/jq '.tab_size = 2 | .translate_tabs_to_spaces = true' "$SUBLIME_USER_SETTINGS" > "$SUBLIME_USER_SETTINGS".new
cp "$SUBLIME_USER_SETTINGS" "$SUBLIME_USER_SETTINGS".backup
mv "$SUBLIME_USER_SETTINGS".new "$SUBLIME_USER_SETTINGS"

# install sublime javascript build config file
SUBLIME_JAVASCRIPT_BUILD_FILENAME="JavaScript.sublime-build"
SUBLIME_JAVASCRIPT_BUILD_SETTINGS_URL="curl -s $PAIRING_SETUP_URL/$SUBLIME_JAVASCRIPT_BUILD_FILENAME"
SUBLIME_JAVASCRIPT_BUILD_FILE="$SUBLIME_SETTINGS_DIR/$SUBLIME_JAVASCRIPT_BUILD_FILENAME"
curl -s "$SUBLIME_JAVASCRIPT_BUILD_SETTINGS_URL" > "$SUBLIME_JAVASCRIPT_BUILD_FILE"

# open syllabus
SYLLABUS_URL="https://learn.makerpass.com/groups/hrsf76/courses/reactorcore/course.syllabus"
open -a "Google Chrome" "$SYLLABUS_URL"