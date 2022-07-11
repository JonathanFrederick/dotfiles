export ZSH="/home/jonafred/.oh-my-zsh"

ZSH_THEME="jonnyrussell"

CASE_SENSITIVE="true"

plugins=(docker npm git)

source $ZSH/oh-my-zsh.sh

# open .zshrc and reset zsh on close

function zrc() {
    vi ~/.zshrc
    . ~/.zshrc
}


# append to path
export PATH=$PATH:/home/jonafred/Library/Python/3.9/bin
export PATH=$PATH:/home/jonafred/.local/bin

# User specific aliases and functions
alias python="python3"
alias pip="pip3"
alias ll="ls -al"

alias apb="ansible-playbook"

function ff() {
    /mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe file://///wsl$/Ubuntu$PWD/$1
}

 # Create new directory and move into it

function mcd() {
  mkdir $1
  cd $1
}

# # Python-related commands
function mkv() {
    if [ $1 ]; then
        virtualenv --python=python3 .venv/$1;
    else
        echo 'Syntax Error: mkv <environment-name>'
    fi
}

# activate the named virtualenv
function v() {
    if [ $1 ]; then
        source .venv/$1/bin/activate
    else
        ls .venv
    fi
}
                                                                                                                  
# deactivate virtualenv
function dv() { deactivate; }

# delete virtualenv
if [ -z "$TMUX" ]
then
    tmux a
fi

autoload -U +X bashcompinit && bashcompinit
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
