PACKAGES=$(ls -1 ~/".config/sublime-text-2/Packages" | tr "\n" "!")
# DEFAULT_PACKAGES=$(ls -1 ~/".config/sublime-text-2/Pristine Packages" | sed -e "s/\.sublime-package$//")
DEFAULT_REGEXP=$(ls -1 ~/".config/sublime-text-2/Pristine Packages" | sed -e "s/\.sublime-package$//" | tr "\n" "|")
DEFAULT_REGEXP=$(echo $DEFAULT_REGEXP | sed -e "s/|$//")
# echo $DEFAULT_REGEXP
# echo $DEFAULT_REGEXP
# echo $PACKAGES
echo $PACKAGES | tr "!" "\n" | grep --invert-match -E "$DEFAULT_REGEXP"
# echo $PACKAGES | tr "!" "\n" | grep --invert-match -E 'Default|CSS|C#|C++|Default|Diff|D|Erlang|Go|Graphviz|Groovy|Haskell|HTML|JavaScript|Java'
# echo $PACKAGES | tr " " "\n" | grep -E 'LESS|YAML'