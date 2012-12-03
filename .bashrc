alias inco="google-chrome --incognito"
alias lock="sleep 1 ; xset dpms force off ; gnome-screensaver-command -l"
alias naut="nautilus"
alias gcompile="java -jar /home/todd/Downloads/compiler-latest/compiler.jar"

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

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# ⍺ - alpha &#9082;
# λ - lambda &lambda; &#955;
# ∴ - therefore &there4; &#8756;
# ± - plus-minus &plusmn; &#177;
# ∓ - plus-minus-alt &plusmn; &#8723;

parse_on_git () {
  # git branch --no-color 1> /dev/null 2> /dev/null && echo "∓" && return
  echo "$"
}


PS1="\[${BOLD}${USER}\]\u \[$PREPOSITION\]at \[$DEVICE\]\h \[$PREPOSITION\]in \[$DIR\]\w\[$PREPOSITION\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$GIT_STATUS\]\$(parse_git_branch)\[$NORMAL\]\n$(parse_on_git) \[$RESET\]"