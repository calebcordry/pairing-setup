#! /bin/bash

# general setup
PAIRING_SETUP_URL="https://raw.githubusercontent.com/jhogan4288/pairing-setup/master"

# install macOS package manager in a location that allows us to install add'l packages without sudo access
BREW_DIR="$HOME/homebrew"
BREW_BIN_DIR="$BREW_DIR/bin"
BREW_BIN="$BREW_BIN_DIR/brew"
BREW_URL="https://github.com/Homebrew/brew/tarball/master"
mkdir "$BREW_DIR" && curl -s -L "$BREW_URL" | tar xz --strip 1 -C homebrew

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

# install jq (command-line JSON manipulator) for modifying sublime settings without trampling current settings
$BREW_BIN install jq

# function for modifying sublime settings
# usage: modify_sublime_settings settings_file jq_script
function modify_sublime_settings ()
{
	# if the settings file doesn't exist, create a skeleton one
	if [ ! -e "${1}" ]; then
		echo '{}' > "${1}"
	fi

	$BREW_BIN_DIR/jq "${2}" "${1}" > "${1}".new

	cp "${1}" "${1}".backup
	mv "${1}".new "${1}"
}

# initialize sublime paths
SUBLIME_BASE_DIR="$HOME/Library/Application Support/Sublime Text 3"
SUBLIME_SETTINGS_DIR="$SUBLIME_BASE_DIR/Packages/User"
SUBLIME_PACKAGE_CONTROL_DIR="$SUBLIME_BASE_DIR/Installed Packages"
mkdir -p "$SUBLIME_SETTINGS_DIR" 
mkdir -p "$SUBLIME_PACKAGE_CONTROL_DIR"

# update main sublime user settings
SUBLIME_USER_SETTINGS="$SUBLIME_SETTINGS_DIR/Preferences.sublime-settings"
modify_sublime_settings "$SUBLIME_USER_SETTINGS" '.tab_size = 2 | .translate_tabs_to_spaces = true'

# in-editor javascript builds via node
SUBLIME_JAVASCRIPT_BUILD_SETTINGS="$SUBLIME_SETTINGS_DIR/JavaScript.sublime-build"
modify_sublime_settings "$SUBLIME_JAVASCRIPT_BUILD_SETTINGS" '.cmd = [ "/Users/student/.nvm/versions/node/v6.9.5/bin/node", "$file" ] | .selector = "source.js"'

# install sublime package manager
SUBLIME_PACKAGE_CONTROL_URL="https://packagecontrol.io/Package%20Control.sublime-package"
SUBLIME_PACKAGE_CONTROL_FILE="$SUBLIME_PACKAGE_CONTROL_DIR/Package Control.sublime-package"
SUBLIME_PACKAGE_CONTROL_SETTINGS="$SUBLIME_SETTINGS_DIR/Package Control.sublime-settings"
curl -s "$SUBLIME_PACKAGE_CONTROL_URL" > "$SUBLIME_PACKAGE_CONTROL_FILE"

# sublime dash integration
modify_sublime_settings "$SUBLIME_PACKAGE_CONTROL_SETTINGS" '.installed_packages = .installed_packages + ["DashDoc"]'

echo ""
echo "--------------------------------------------------------------------"
echo "Restart Sublime if it is currently running to activate new settings."
echo "--------------------------------------------------------------------"
echo ""

# open syllabus
SYLLABUS_URL="https://learn.makerpass.com/groups/hrsf76/courses/reactorcore/course.syllabus"
open -a "Google Chrome" "$SYLLABUS_URL"