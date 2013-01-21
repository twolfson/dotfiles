PACKAGES=$(ls -1 ~/".config/sublime-text-2/Packages")
DEFAULT_PACKAGES=$(ls -1 ~/".config/sublime-text-2/Pristine Packages" | sed -e "s/\.sublime-package$//")
#echo $PACKAGES | grep --invert-match $DEFAULT_PACKAGES
echo $(echo $DEFAULT_PACKAGES | sed -e "s/./|/g")