# Bash settings
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash_profile ~/.bash_profile

# Link up git config
ln -s $PWD/.gitconfig ~/.gitconfig

# Applications (configured for Linux Mint)
# cat /usr/share/applications/defaults.list | sed 's/gedit.desktop/sublime-text-2.desktop;gedit.desktop/'
mkdir -p ~/.local/share/applications
ln -s $PWD/sublime-text-2.desktop ~/.local/share/applications/sublime-text-2.desktop
ln -s $PWD/defaults.list ~/.local/share/applications/defaults.list

# Symlink sublime text
sudo ln -s /usr/lib/sublime-text-2/sublime_text /usr/bin/sublime_text
su -c 'echo "sublime_text \$@ > /dev/null 2> /dev/null &" > /usr/bin/subl'
sudo chmod +x /usr/bin/subl

# Sublime settings
mkdir -p ~/.config/sublime-text-2/Packages/User
ln -s $PWD/.config/sublime-text-2/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings

# Fonts
mkdir -p ~/.fonts
# I no longer use powerline (traded it in for Sexy Bash Prompt) but still like Anonymous Pro
ln -s $PWD/.fonts/anonymous+Pro-Powerline.ttf ~/.fonts/anonymous+Pro-Powerline.ttf

# One-time scripts
./once.sh
