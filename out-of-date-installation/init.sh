# Update to latest firefox and remove Mint fixins
sudo apt-get remove firefox
rm -rf ~/.mozilla
sudo apt-get install firefox
# HAND: Set up firefox sync

# Install git
sudo apt-get install git

# Install howdoi
sudo apt-get install python-pip
sudo pip install howdoi

# Install hub
sudo apt-get install rubygems
gem install hub

# Set up SSH keys for github
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -b 2048 -t rsa -C github -f github_rsa
# HAND: Upload key to github

# Install github files
mkdir github
cd github
git clone git@github.com:twolfson/dotfiles.git

# Install Chrome
# HAND: Install Chrome
# HAND: Disable system borders for Chrome
sudo apt-get install curl
# HAND: Enable all firebug panels
# HAND: Enable firebug always on
# HAND: Disable cache via web developer toolbar
# HAND: Set up time/date for Cinnamon
# HAND: Disable hot panels
# Hand: Install package control to sublime
# HAND: Install node
sudo npm install -g grunt@0.3.17 nodemon
sudo npm install -g n
sudo n stable
# HAND: gnome-system-panel via ctrl+alt+delete
sudo apt-get install nvidia-current
sudo nvidia-xconfig
sudo nvidia-xconfig
# HAND: Patch custom shortcut support -- http://forums.linuxmint.com/viewtopic.php?f=208&t=117585&start=20#p655476
# HAND: Add ctrl+alt+delete -> gnome-system-monitor shortcut
sudo npm install -g underscore-cli node-gyp
# HAND: Firebug -> HTML -> Style -> Show user agent CSS
# HAND: Sublime -> Find in files -> Disable buffer
# HAND: Install Google Music Manager
sudo apt-get remove phantomjs
# HAND: Download latest phantomjs, unzip, and copy to /usr/bin/phantomjs
sudo apt-get install virtualbox-4.2
pip install livereload
# HAND: Install jDownloader
