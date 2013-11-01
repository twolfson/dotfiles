### Common commands ###
if [[ $(ls /Applications/Google\ Chrome.app 2> /dev/null) != "" ]]; then
  alias inco="open -a /Applications/Google\\ Chrome.app --args --incognito"
else
  alias inco="google-chrome --incognito"
fi
alias lock="sleep 1 ; xset dpms force off ; gnome-screensaver-command -l"
alias naut="nautilus"
alias ff-dev="firefox -no-remote -p dev"
alias exitcode="echo \$?"

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

### Git aliases ###
alias g--="git checkout -"
alias g-~="git checkout master"
alias g--m="git checkout - && git merge -"

### Node aliases ###
# npm without 304 requests. Perfect for offline use!
alias lnpm="npm --no-registry"

### Typos suck ###
alias gi="git" # Works great with git config help.autocorrect
alias gti="git"

### Clipboard help ###
if which pbcopy > /dev/null; then
  alias copy="pbcopy"
else
  alias copy="xclip -selection c"
fi

### Live-reload specific ###
alias tiny-lr-update="curl http://localhost:35729/changed?files=/"

# The following 2 are taken from https://coderwall.com/p/lyutxw
### Enable aliases to be `sudo`ed ###
alias sudo="sudo "

### Gzip-enabled `curl` ###
alias gurl="curl --compressed"

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

### Git command ###
# http://rob.by/2013/remove-merged-branches-from-git/
_git_cleanup () {
  current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ "$current_branch" != "master" ]; then
    echo "WARNING: You are on branch $current_branch, NOT master."
  fi
    echo "Fetching merged branches..."
  git remote prune origin
  remote_branches=$(git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$")
  local_branches=$(git branch --merged | grep -v 'master$' | grep -v "$current_branch$")
  if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
    echo "No existing branches have been merged into $current_branch."
  else
    echo "This will remove the following branches:"
    if [ -n "$remote_branches" ]; then
      echo "$remote_branches"
    fi
    if [ -n "$local_branches" ]; then
      echo "$local_branches"
    fi
    read -p "Continue? (y/n): " -n 1 choice
    echo
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
      # Remove remote branches
      git push origin `git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$" | sed 's/origin\//:/g' | tr -d '\n'`
      # Remove local branches
      git branch -d `git branch --merged | grep -v 'master$' | grep -v "$current_branch$" | sed 's/origin\///g' | tr -d '\n'`
    else
      echo "No branches removed."
    fi
  fi
}

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
