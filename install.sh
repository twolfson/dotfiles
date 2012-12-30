# Bash settings
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash_profile ~/.bash_profile

# Applications (configured for Linux Mint)
# cat /usr/share/applications/defaults.list | sed 's/gedit.desktop/sublime-text-2.desktop;gedit.desktop/'
ln -s $PWD/sublime-text-2.desktop ~/.local/share/applications/sublime-text-2.desktop
ln -s $PWD/defaults.list ~/.local/share/applications/defaults.list

# Fonts
mkdir -p ~/.fonts
# I no longer use powerline (traded it in for Sexy Bash Prompt) but still like Anonymous Pro
ln -s $PWD/.fonts/anonymous+Pro-Powerline.ttf ~/.fonts/anonymous+Pro-Powerline.ttf

# One-time scripts
./once.sh