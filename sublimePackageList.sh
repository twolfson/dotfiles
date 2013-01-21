PACKAGES=$(ls -1 ~/".config/sublime-text-2/Packages")
DEFAULT_PACKAGES=$(ls -1 ~/".config/sublime-text-2/Pristine Packages" | sed -e "s/\.sublime-package$//")
DEFAULT_REGEXP=$(echo $DEFAULT_PACKAGES | tr " " "|")
DEFAULT_REGEXP="/("$DEFAULT_REGEXP")/"
# echo $DEFAULT_REGEXP
# echo $PACKAGES | grep --invert-match -e $DEFAULT_REGEXP
echo $PACKAGES | tr " " "\n" | grep -e "LESS"
echo $PACKAGES | tr " " "\n" | grep -e "LESS|YAML"