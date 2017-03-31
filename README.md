Setup scripts to configure Hack Reactor pairing workstations.

To run:  

`curl -s https://raw.githubusercontent.com/jhogan4288/pairing-setup/master/pairing-setup.sh | bash`

Current functionality:
* Installs pomander
* Installs [Dash](https://kapeli.com/dash), a great desktop developer reference app
** You'll need to manually install most Dash docsets (can't be done from the command line, I tried to automate it).  `Dash` -> `Preferences` -> `Downloads`.  Get docsets for Javascript, Underscore, and whatever else you like.
** I recommend setting a global hotkey under `Dash` -> `Preferences` -> `General`
* Updates Sublime settings
** `"tab_size": 2`
** `"tanslate_tabs_to_spaces": true`
