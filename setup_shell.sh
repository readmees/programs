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
	sudo apt install python3-pip #TODO is this nessecary after installing python 3
	sudo pip3 install notebook
	sudo apt install curl
	sudo apt install git
	sudo apt install snapd
	
        # First did some of these things with Linux Brew, but I'll wait till cask is available
 
        # Download Gnome and eyecandy
        echo "Carefull, this program assumes you can run a Gnome environment!" 
        sudo apt install chrome-gnome-shell

        ## Download Tweaks
        sudo apt install gnome-tweak-tool
	
        ## Download Paperwm - Gnome extension
	git clone 'https://github.com/paperwm/PaperWM.git' "${XDG_DATA_HOME:-$HOME/.local/share}/gnome-shell/extensions/paperwm@hedning:matrix.org"
        ./install
     
        ## Download Dash to Dock - Gnome extension
        git clone https://github.com/micheleg/dash-to-dock.git
        make
        make install
        
        # Download programs
	sudo snap install brave
	sudo snap install spotify
	sudo snap install code --classic
	sudo snap install pulseaudio
	sudo snap install vlc

    fi
else
    echo "I personally only use Linux and MacOS, with a few simple modifications, you could use this for Windows too!"
    echo "Please modify or use Linux or MacOS, exiting..."
fi
