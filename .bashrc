#!/usr/bin/env bash
### Common commands ###
# Open an incognito window in Chrome
if [[ $(ls /Applications/Google\ Chrome.app 2> /dev/null) != "" ]]; then
  alias inco="open -a /Applications/Google\\ Chrome.app --args --incognito"
else
  alias inco="google-chrome --incognito"
fi

# Mimic OSX's `say` command on Linux
if which festival 2>&1 > /dev/null; then
  function say() {
    echo "(SayText \"$*\")" | festival --pipe
  }
fi

# Adjust volume easily
if which pactl &> /dev/null; then
  alias volume="pactl -- set-sink-volume 1"
fi

# Lock the computer
alias lock="sleep 1 ; xset dpms force off ; gnome-screensaver-command -l"

### Directory movements ###
# cd is now pushd ;D
alias    cd="pushd $1          > /dev/null"

# .. brings you up one level, ... is two levels, etc.
# Additionally, these are added to the directory stack
alias    ..="pushd ..          > /dev/null"
alias   ...="pushd ../..       > /dev/null"
alias  ....="pushd ../../..    > /dev/null"
alias .....="pushd ../../../.. > /dev/null"

# ~ brings you to your home directory and adds it to the directory stack
alias     ~="pushd ~ > /dev/null"

# ,, brings you to the last directory. ,,, brings you to the second to last directory, etc.
alias    ,,="popd    > /dev/null"
alias   ,,,=",,   && ,,"
alias  ,,,,=",,,  && ,,"
alias ,,,,,=",,,, && ,,"

# , echoes out the current directory stack
alias     ,="dirs -l -v $*"

### Node aliases ###
# npm without 304 requests. Perfect for offline use!
alias lnpm="npm --no-registry"

### Typos suck ###
alias gi="git" # Works great with git config help.autocorrect
# Replaced `gti` with https://github.com/rwos/gti (speed 100)
alias tgi="git"

### Clipboard help ###
if which pbcopy > /dev/null; then
  alias copy="pbcopy"
else
  alias copy="xclip -selection c"
fi

### Consistent sorting command ###
if which gsort > /dev/null; then
  alias sort="gsort"
fi

### Live-reload specific ###
alias tiny-lr-update="curl http://localhost:35729/changed?files=/"

### Enable aliases to be `sudo`ed ###
# Taken from https://coderwall.com/p/lyutxw
alias sudo="sudo "

### Vagrant commands ###
alias install-node="if ! which node &> /dev/null; then sudo apt-get install -y python-software-properties python g++ make; sudo add-apt-repository -y ppa:chris-lea/node.js; sudo apt-get update; sudo apt-get install -y nodejs; fi"
alias install-listen-spawn="vagrant-install-node; if ! which listen-spawn &> /dev/null; then sudo npm install -g listen-spawn; fi"
vagrant_listen_spawn () {
  echo "Connected to $1 localhost:7060"
  vagrant ssh $1 -- -N -L 7060:localhost:7060
}
alias vagrant-listen-spawn="vagrant_listen_spawn"

### Git autocompletion ###
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi

if [ -f /etc/bash_completion.d/git-extras ]; then
  . /etc/bash_completion.d/git-extras
fi

if [ -f /etc/bash_completion.d/git-sqwish ]; then
  . /etc/bash_completion.d/git-sqwish
fi

### Fabric bash completion ###
# Taken from http://rubayeet.wordpress.com/2012/03/26/tab-completion-for-fabric-tasks-on-os-x/
function _fab_complete() {
    local cur
    if [ -f "fabfile.py" ]; then
        cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=( $(compgen -W "$(fab -F short -l)" -- ${cur}) )
        return 0
    else
        # no fabfile.py found. Don't do anything.
        return 1
    fi
}
complete -o nospace -F _fab_complete fab

# If we are in an xterm and we can support 256 colors, do it
# DEV: This is used to get better colors in sexy-bash-prompt
if [[ "$TERM" == "xterm" ]] && infocmp xterm-256color &> /dev/null; then
  export TERM="xterm-256color"
fi

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt

# Expose helper method for git branch
function BRANCH() {
  echo $(get_git_branch)
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# PATH=$PATH:/usr/local/go/bin # Add Go to path

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## Python virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# Added by travis gem
if test -f ~/.travis/travis.sh; then
  source ~/.travis/travis.sh
fi

# If there is linuxbrew, add it to PATH/LD_LIBRARY_PATH
if test -d ~/.linuxbrew; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

# If there is a private bash profile, use it
if test -f ~/.private_bash_profile; then
  source ~/.private_bash_profile
fi
