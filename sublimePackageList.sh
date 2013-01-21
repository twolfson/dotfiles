PACKAGES=$(ls -1 ~/".config/sublime-text-2/Packages" | tr "\n" "!")
DEFAULT_REGEXP=$(ls -1 ~/".config/sublime-text-2/Pristine Packages" | sed -e "s/\.sublime-package$//" | tr "\n" "|")
DEFAULT_REGEXP=$(echo $DEFAULT_REGEXP | sed -e "s/|$//")
INSTALLED_PACKAGES=$(echo $PACKAGES | tr "!" "\n" | grep --invert-match -E "$DEFAULT_REGEXP" | tr "\n" "!")
echo $INSTALLED_PACKAGES | tr "!" "\n" > ./sublimePackageList.txt