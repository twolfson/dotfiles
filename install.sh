# Bash settings
if ! test -f ~/.bashrc; then
  ln -s $PWD/.bashrc ~/.bashrc
  echo "Installed ~/.bashrc" 1>&2
else
  echo "~/.bashrc already exists" 1>&2
fi
if ! test -f ~/.bash_profile; then
  ln -s $PWD/.bash_profile ~/.bash_profile
  echo "Installed ~/.bash_profile" 1>&2
else
  echo "~/.bash_profile already exists" 1>&2
fi

# Link up git config
if ! test -f ~/.gitconfig; then
  ln -s $PWD/.gitconfig ~/.gitconfig
  echo "Installed ~/.gitconfig" 1>&2
else
  echo "~/.gitconfig already exists" 1>&2
fi

# Applications (configured for Linux Mint)
# cat /usr/share/applications/defaults.list | sed 's/gedit.desktop/sublime-text-2.desktop;gedit.desktop/'
if false; then
  mkdir -p ~/.local/share/applications
  ln -s $PWD/sublime-text-2.desktop ~/.local/share/applications/sublime-text-2.desktop
  ln -s $PWD/defaults.list ~/.local/share/applications/defaults.list
else
  echo "Skipping Linux Mint dotfiles (they seem like a bad idea)" 1>&2
fi

# Symlink sublime text
if false; then
  sudo ln -s /usr/lib/sublime-text-2/sublime_text /usr/bin/sublime_text
  su -c 'echo "sublime_text \$@ > /dev/null 2> /dev/null &" > /usr/bin/subl'
  sudo chmod +x /usr/bin/subl
else
  echo "Skipping \`sublime_text\` symlink (also seems like a bad idea)" 1>&2
fi

# Sublime settings
if false; then
  mkdir -p ~/.config/sublime-text-2/Packages/User
  ln -s $PWD/.config/sublime-text-2/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings
else
  echo "Skipping \`sublime_text\` config (not maintained frequently enough)" 1>&2
fi

# Fonts
# Using Anonymous Pro but not powerline piece of font
if ! test -f ~/.fonts/anonymous+Pro-Powerline.ttf; then
  mkdir -p ~/.fonts
  ln -s $PWD/.fonts/anonymous+Pro-Powerline.ttf ~/.fonts/anonymous+Pro-Powerline.ttf
  echo "Installed Anonymous Pro font" 1>&2
else
  echo "Anonymous Pro already installed" 1>&2
fi

# Nano settings
if ! test -f ~/.nanorc; then
  ln -s $PWD/.nanorc ~/.nanorc
  echo "Installed \`nano\` syntax highlighting" 1>&2
else
  echo "\`nano\` syntax highlighting already installed" 1>&2
fi
