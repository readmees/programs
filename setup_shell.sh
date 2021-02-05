#!/bin/bash

## This program should contain all my brews
### to uninstall: brew uninstall packageName
### to remove: brew remove packageName  
if [ "$(uname)" = "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    sudo apt install curl
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install bash
    brew install git
    brew install apm-bash-completion
    brew install python3
    brew install youtube-dlbbb
    brew install tree

    brew install --cask jupyter-notebook-ql
    brew install --cask spotify
    brew install --cask brave-browser
    brew install --cask visual-studio-code

    if [ "$(uname)" = "Darwin" ]; then
        # Do something under Mac OS X platform
        echo "Nice! Let\'s download Brew and some window managers"
        brew install --cask amethyst
        brew install --cask karabiner-elements 
        brew install --cask tiles    
    elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
        # Do something under GNU/Linux platform
        echo "Nice! Let's download fe Linux Brew, Tweaks and Paperwm"

        # Download Linux Brew
        test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
        test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
        echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile    
        
        # Download Gnome
        echo "Carefull, this program assumes you can run a Gnome environment!" 
        sudo apt install chrome-gnome-shell

        # Download Tweaks
        sudo add-apt-repository universe
        sudo apt install gnome-tweak-tool

        # Download Paperwm - Gnome extension
        git clone 'https://github.com/paperwm/PaperWM.git' "${XDG_DATA_HOME:-$HOME/.local/share}/gnome-shell/extensions/paperwm@hedning:matrix.org"
        # TODO: Maybe this clone should be removed?
        ./install
        # Probably moved into this directory now so navigate to home 
        #TODO check dit
        cd ~/

        # Download Dash to Dock - Gnome extension
        git clone https://github.com/micheleg/dash-to-dock.git
        make
        make install
        # Probably moved into this directory now so navigate to home 
        #TODO check dit
        cd ~/

    fi
else
    echo "I personally only use Linux and MacOS, with a few simple modifications, you could use this for Windows too!"
    echo "Please modify or use Linux or MacOS, exiting..."
fi
