# Specify Sublime Text as our editor
export EDITOR=subl

# Allow for CLI coloring
export CLICOLOR=1

# Run .bashrc (for tmux)
. ~/.bashrc

# Run private bash items
if test -f ~/.private_bash_profile; then
  . ~/.private_bash_profile
fi

export PATH="$HOME/.poetry/bin:$PATH"
