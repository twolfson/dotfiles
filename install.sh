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

# Link up git ignore
if ! test -f ~/.gitignore; then
  ln -s $PWD/.gitignore ~/.gitignore
  echo "Installed ~/.gitignore" 1>&2
else
  echo "~/.gitignore already exists" 1>&2
fi

# Applications (configured for Linux Mint)
# cat /usr/share/applications/defaults.list | sed 's/gedit.desktop/sublime-text-3.desktop;gedit.desktop/'
if false; then
  mkdir -p ~/.local/share/applications
  ln -s $PWD/defaults.list ~/.local/share/applications/defaults.list
else
  echo "Skipping Linux Mint dotfiles (they seem like a bad idea)" 1>&2
fi

# gnome-pie
if false; then
  mkdir -p ~/.config/
  ln -s $PWD/.config/gnome-pie ~/.config/gnome-pie
else
  echo "Skipping gnome-pie configuration (already exists)" 1>&2
fi

# gnome-terminal
if false; then
  mkdir -p ~/.gconf/apps/
  ln -s $PWD/.gconf/apps/gnome-terminal ~/.gconf/apps/gnome-terminal
else
  echo "Skipping gnome-terminal configuration (already exists)" 1>&2
fi

# Sublime Text 3 settings
if ! test -d ~/.config/sublime-text-3/Packages/User; then
  mkdir -p ~/.config/sublime-text-3/Packages/
  ln -s $PWD/.config/sublime-text-3/Packages/User ~/.config/sublime-text-3/Packages/User
  echo "Installed Sublime Text 3 \`User\` folder" 1>&2
else
  echo "Sublime Text 3 \`User\` folder already exists" 1>&2
fi

# Set up Meld
if false; then
  echo "#!/usr/bin/env bash
set -e
open -W -a Meld --args $*" > ~/bin/meld
  chmod +x ~/bin/meld
fi

# Fonts
# Using Anonymous Pro but not powerline piece of font
for file in .fonts/*; do
  if ! echo "$file" | grep -E ".ttf$"; then
    continue
  fi
  if ! test -f ~/"$file"; then
    mkdir -p ~/.fonts
    ln -s $PWD/"$file" ~/"$file"
    echo "Installed $file font" 1>&2
  else
    echo "$file already installed" 1>&2
  fi
done

# Nano settings
if ! test -f ~/.nanorc; then
  ln -s $PWD/.nanorc ~/.nanorc
  echo "Installed \`nano\` syntax highlighting" 1>&2
else
  echo "\`nano\` syntax highlighting already installed" 1>&2
fi
