# Specify Sublime Text as our editor
export EDITOR=subl

# Allow for CLI coloring
export CLICOLOR=1

# Run .bashrc (for tmux)
. ~/.bashrc

# Silence zsh/bash default issue for OS X
export BASH_SILENCE_DEPRECATION_WARNING=1

# Run private bash items
if test -f ~/.private_bash_profile; then
  . ~/.private_bash_profile
fi


. /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PATH="$HOME/.poetry/bin:$PATH"
