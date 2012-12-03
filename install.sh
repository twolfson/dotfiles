ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash_profile ~/.bash_profile
cat .desktop >> ~/.local/share/applications/.desktop

# cat /usr/share/applications/defaults.list | sed 's/gedit.desktop/sublime-text-2.desktop;gedit.desktop/'
ln -s $PWD/defaults.list ~/.local/share/applications/defaults.list
