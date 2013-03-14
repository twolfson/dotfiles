dotfiles
========

A collection of my dotfiles, currently fragmented between [Linux Mint (Cinnamon)][mint] and [Mac OS X Mountain Lion][osx].

[mint]: http://www.linuxmint.com/
[osx]: http://www.apple.com/osx/

Getting started
---------------
To install `dotfiles` (Mint only), run `./install.sh`.

This will create symlinks and copy/append files when symlinks are inappropriate.

Files
-----

- `.bash_profile` - Run at login. Sets default editor to [Sublime Text 2][subl], enables CLI coloring, and runs `.bashrc` for aliases and such.
- `.bashrc` - Run when a new terminal is opened, creates a bunch of aliases, enables tab completion for `git`, and adds customized sexy bash prompt.

[subl]: http://www.sublimetext.com/2

### Aliases
#### Programs

- `inco` - Opens a Chrome Incognito window
- `lock` - Locks computer via screensaver (designed for Gnome/Cinnamon)
- `naut` - Opens file browser (designed for Nautilus)

#### Directory movements

- `cd` - Moved to directory and pushes onto directory stack (via `pushd`)
- `..`, [...], `.....` - Navigate up one, [...], five directories (via `pushd`)
- `~` - Navigate to the home directory (via `pushd`)
- `,,`, [...], `,,,,,` - Navigate back one, [...], five directories (in the `pushd` stack via `popd`)
- `,` - List out current `pushd`/`popd` stack

#### Git aliases (not used often)

- `g--` - Checkout previous branch
- `g-~` - Checkout master branch (I really wanted `git ~` but failed to get it working)
- `g--m` - Merge current branch to previous branch

### Bash prompt


Workflow
--------

Installed Programs
------------------

- Sublime Text 2
- nodemon
- node/npm
- hub
- howdoi
- grunt@0.3.17

### Linux Specific

- gnome-terminal

### Mac OS X Specific

- Dock view
- Spectacles
