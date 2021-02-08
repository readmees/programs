#!/bin/bash

## This program should contain all my programs and dependencies
### to uninstall: brew uninstall packageName
### to remove: brew remove packageName  
if [ "$(uname)" = "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    if [ "$(uname)" = "Darwin" ]; then
        # Do something under Mac OS X platform
        echo "Nice! Let\'s download Brew and some window managers"
	
	# Download Brew    	
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Download brews 
	brew install git
	brew install bash
	brew install apm-bash-completion
	brew install python3
	brew install jupyter
	brew install youtube-dl
	brew install tree
	
	## Mac only programs
	brew install --cask karabiner-elements 
	brew install --cask tiles  
	
	## Programs I would like on all my (capable) computers
	brew install --cask brave-browser
	brew install --cask spotify
	brew install --cask visual-studio-code
	brew install --cask vlc
    elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
        # Do something under GNU/Linux platform
	echo "Nice! Let's download some nice terminal tools"
	sudo apt-get update
	sudo add-apt-repository universe # For e.g. Tweaks and Tree?
	sudo apt-get install python3.8
	sudo apt-get install youtube-dl
	sudo apt-get install tree
	sudo apt install python3-pip #TODO is this nessecary after installing python3?
	sudo pip3 install notebook
	sudo apt install curl
	sudo apt install git
	sudo apt install snapd
	
        # First did some of these things with Linux Brew, but I'll wait till cask is available
 
        # Download Gnome and eyecandy?
        echo "Are you (able of) running a Gnome (e.g. Ubuntu) environment? [Y/n]"
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
		sudo apt-get install gettext # For Makefile dash-to-dock
		sudo apt install chrome-gnome-shell
		
		# Download Tweaks
		sudo apt install gnome-tweak-tool
		
		# Download Paperwm - Gnome extension
		git clone 'https://github.com/paperwm/PaperWM.git' "${XDG_DATA_HOME:-$HOME/.local/share}/gnome-shell/extensions/paperwm@hedning:matrix.org"
		./install
	     
		# Download Dash to Dock - Gnome extension
		git clone https://github.com/micheleg/dash-to-dock.git
		(cd ~/dash-to-dock && make)
		(cd ~/dash-to-dock && make install) #TODO Doesn't 
		
		# Download programs
		sudo snap install brave
		sudo snap install spotify
		sudo snap install code --classic
		sudo snap install pulseaudio
		sudo snap install vlc
		echo "All done, enjoy!"
	else
		echo "You didn't type Y, so this program assumes you can't run a Gnome environment and won't download most of my programs!" 
		echo "For me this means I'm using lUbuntu, so this program won't download big programs like Spotify etc. If for you this is different, please slightly modify the program, exiting..."
	fi     
    fi
else
    echo "I personally only use Linux and MacOS, with a few simple modifications, you could use this for Windows too!"
    echo "Please modify or use Linux or MacOS, exiting..."
fi
