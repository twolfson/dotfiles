# dotfiles install/configuration commands
Run the following `bash` snippets to complete setup for the relevant program

## bash
```bash
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
```

## git
```bash
if ! test -f ~/.gitconfig; then
  ln -s $PWD/.gitconfig ~/.gitconfig
  echo "Installed ~/.gitconfig" 1>&2
else
  echo "~/.gitconfig already exists" 1>&2
fi

if ! test -f ~/.gitignore; then
  ln -s $PWD/.gitignore ~/.gitignore
  echo "Installed ~/.gitignore" 1>&2
else
  echo "~/.gitignore already exists" 1>&2
fi
```

## Sublime Text 3
```bash
if ! test -d ~/.config/sublime-text-3/Packages/User; then
  mkdir -p ~/.config/sublime-text-3/Packages/
  ln -s $PWD/.config/sublime-text-3/Packages/User ~/.config/sublime-text-3/Packages/User
  echo "Installed Sublime Text 3 \`User\` folder" 1>&2
else
  echo "Sublime Text 3 \`User\` folder already exists" 1>&2
fi
```

## Fonts
```bash
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
```

## nano
```bash
if ! test -f ~/.nanorc; then
  ln -s $PWD/.nanorc ~/.nanorc
  echo "Installed \`nano\` syntax highlighting" 1>&2
else
  echo "\`nano\` syntax highlighting already installed" 1>&2
fi
```
