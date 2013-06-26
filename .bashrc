### Common commands ###
if [[ $(ls /Applications/Google\ Chrome.app 2> /dev/null) != "" ]]; then
  alias inco="open -a /Applications/Google\\ Chrome.app --args --incognito"
else
  alias inco="google-chrome --incognito"
fi
alias lock="sleep 1 ; xset dpms force off ; gnome-screensaver-command -l"
alias naut="nautilus"
alias ff-dev="firefox -no-remote -p dev"

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

### Git autocompletion ###
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi

if [ -f /etc/bash_completion.d/git-extras ]; then
  . /etc/bash_completion.d/git-extras
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

### Bash prompt ###

# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://img.gf3.ca/d54942f474256ec26a49893681c49b5a.png
# A big thanks to \amethyst on Freenode

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif [[ $TERM != dumb ]] && infocmp xterm-256color >/dev/null 2>&1; then export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      PREPOSITION=$(tput setaf 7) #WHITE
      USER=$(tput setaf 27) #BLUE
      DEVICE=$(tput setaf 39) #INDIGO
      DIR=$(tput setaf 76) #GREEN
      GIT_STATUS=$(tput setaf 154) #YELLOW
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      DIR=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      PREPOSITION=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    NORMAL=$PREPOSITION
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    DIR="\033[1;32m"
    PURPLE="\033[1;35m"
    PREPOSITION="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

get_git_branch () {
  # Grab the branch                  | ltrim unused rows    Remove asterisk
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

get_origin_diff () {
  # Grab the branches
  BRANCH=$(get_git_branch)
  REMOTE_BRANCH=origin/$BRANCH

  # Look up the result
  git log $REMOTE_BRANCH..$BRANCH -1 --no-color 2> /dev/null | head -n1
}

parse_git_behind () {
  # Grab the branch
  BRANCH=$(get_git_branch)

  # TODO: Echo filled in delta when dirty and unsynced
  # If the diff         begins with "commit"
  [[ $(get_origin_diff | sed -e "s/^\(commit\).*/\1/") == "commit" ]] ||
    # or it has not been merged into origin
    [[ $(git branch -r --no-color 2> /dev/null | grep origin/$BRANCH 2> /dev/null | tail -n1) == "" ]] &&
    # echo our character
    echo 1
}

parse_git_dirty () {
  # nothing to commit, working directory clean
  # nothing to commit (working directory clean)
  [[ $(git status 2> /dev/null | tail -n1 | sed -E "s/nothing to commit..working directory clean.?/1/") != "1" ]] && echo 1
}
parse_git_branch () {
  # Grab the branch
  BRANCH=$(get_git_branch)

  # If there are any branches
  if [[ $BRANCH != "" ]]; then
    # Echo the branch
    OUTPUT=$BRANCH

    # Grab the git dirty and git behind
    DIRTY_BRANCH=$(parse_git_dirty)
    BRANCH_BEHIND=$(parse_git_behind)

    # If we are dirty and behind, append
    if [[ $DIRTY_BRANCH == 1 && $BRANCH_BEHIND == 1 ]]; then
      OUTPUT=$OUTPUT"▲"
    # Otherwise, if we are behind, append
    elif [[ $BRANCH_BEHIND == 1 ]]; then
      OUTPUT=$OUTPUT"△"
    # Otherwise, if we are dirty, append
    elif [[ $DIRTY_BRANCH == 1 ]]; then
      OUTPUT=$OUTPUT"*"
    fi

    # Echo our output
    echo $OUTPUT
  fi
}

# ⍺ - alpha &#9082;
# λ - lambda &lambda; &#955;
# ∴ - therefore &there4; &#8756;
# ± - plus-minus &plusmn; &#177;
# ∓ - plus-minus-alt &plusmn; &#8723;
# Δ - &Delta; &#916;
# ∇ - &nabla; &#8711;
# ▵ - Smaller delta &#9653;
# ▴ - Smaller filled &#9652;
# ▲ - Slightly bigger delta &#9651;
# △ - Slightly bigger filled &#9650;

parse_on_git () {
  # git branch --no-color 1> /dev/null 2> /dev/null && echo "∓" && return
  echo "$"
}

# Convenience method/variable
BRANCH () {
  echo $(get_git_branch)
}

# When on clean git branch,              $USER at $COMPUTER in $PWD on $branch
# When on dirty git branch,              $USER at $COMPUTER in $PWD on $branch*
# When on unsynced git branch,           $USER at $COMPUTER in $PWD on $branch▵
# When on unsynced and dirty git branch, $USER at $COMPUTER in $PWD on $branch▴

PS1="\[${BOLD}${USER}\]\u \[$PREPOSITION\]at \[$DEVICE\]\h \[$PREPOSITION\]in \[$DIR\]\w\[$PREPOSITION\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$GIT_STATUS\]\$(parse_git_branch)\[$NORMAL\]\n$(parse_on_git) \[$RESET\]"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# PATH=$PATH:/usr/local/go/bin # Add Go to path
