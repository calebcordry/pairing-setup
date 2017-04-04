Setup scripts to configure Hack Reactor pairing workstations.

To run:  

`curl -s https://raw.githubusercontent.com/jhogan4288/pairing-setup/master/pairing-setup.sh | bash`

The fastest way to access the above command on a new pairing station is to type `github.com/jhogan4288` in the Chrome address bar, then click the "pairing-setup" repo.  For students in hrsf76, this link is also available on my Slack profile (@james) for reference.

If anything gets borked, rebooting your pairing station will re-image it back to its daily starting configuration.

Current functionality:
* Installs [Dash](https://kapeli.com/dash), a great desktop developer reference app
  * You'll need to manually install most Dash docsets (can't be done from the command line, I tried to automate it).  `Dash` -> `Preferences` -> `Downloads`.  Get docsets for Javascript, Underscore, and whatever else you like.
  * Press `Ctrl-H` in Sublime to immediately look up the function or keyword under the cursor.
* Enables running JavaScript code directly from Sublime via node.js (&#8984;+B)
* Sets Sublime tab size to 2
* Installs pomander
* Installs GitHub desktop client
