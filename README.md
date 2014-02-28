# dotfiles

A collection of my dotfiles (e.g. `.config`, `.bashrc`)

This is written for both [Linux Mint 14 (Cinnamon)][mint] and [Mac OS X Mountain Lion][osx].

[mint]: http://www.linuxmint.com/
[osx]: http://www.apple.com/osx/

## Getting started
To install `dotfiles`, run `./install.sh`.

This will create symlinks and copy/append files when symlinks are inappropriate.

### Documentation
#### Bash prompt
My bash prompt is hosted at [twolfson/sexy-bash-prompt][]. It provides file system, `git branch`, and `git status` via symbols.

[twolfson/sexy-bash-prompt]: https://github.com/twolfson/sexy-bash-prompt

![Example screenshot of sexy-bash-prompt](https://f.cloud.github.com/assets/902488/759832/eea8511e-e79b-11e2-9012-3a1ac3ff9e36.png)

#### Files

- `.bash_profile` - Bash script that is run at login
    - Sets default editor to [Sublime Text 2][]
    - Enables CLI coloring
    - Runs `.bashrc` for aliases and `PATH` updates
- `.bashrc` - Run when a new terminal is opened
    - Creates aliases
    - Add helper and polyfill commands
    - Enables tab completion for `git` and `fab`
    - Adds customized sexy bash prompt
- `.config/sublime-text-2/Packages/User` - Configuration for [Sublime Text 2][]
    - Includes list of commonly used packages in [Package Control.sublime-settings][]
- `.fonts/anonymous+Pro-Powerline.ttf` - [Anonymous Pro][], a monospaced font with serifs
    - This font comes from [powerline][] which contains additional characters. However, I don't use them.
- `.gitconfig`
    - Set up credentials for `twolfson` (me)
    - Disable creation of `.orig` files
    - Set `meld` as mergetool/difftool
    - Enable `git` colors
    - Add aliases
        - `add-pr` - Adds a new `remote` for fetching pull requests as branches
- `.gconf` - Configurations for Gnome (e.g. Ctrl+Alt+Del for `gnome-system-monitor`)

[Sublime Text 2]: http://www.sublimetext.com/2
[Package Control.sublime-settings]: .config/sublime-text-2/Packages/User/Package Control.sublime-settings
[Anonymous Pro]: http://www.marksimonson.com/fonts/view/anonymous-pro
[powerline]: https://github.com/milkbikis/powerline-shell
[pr-gist]: https://gist.github.com/piscisaureus/3342247

##### `.bashrc` aliases

- `inco` - Opens a Chrome Incognito window
- `lock` - Locks computer via screensaver on Gnome/Cinnamon

#### Directory movements

- `cd` - Moved to directory and pushes onto directory stack (via `pushd`)
- `..`, [...], `.....` - Navigate up one, [...], five directories (via `pushd`)
- `~` - Navigate to the home directory (via `pushd`)
- `,,`, [...], `,,,,,` - Navigate back one, [...], five directories (in the `pushd` stack via `popd`)
- `,` - List out current `pushd`/`popd` stack

## Workflow

- Use multiple monitors, layout to see everything at a glance.
    - [Spectacles][spectacles] (Mac OS X), [Compiz Config Settings Manager][ccsm] (Gnome), or [AeroSnap][aero] + [WindowPad][windowpad] (Windows) help **a ton**.
    - For more info on Windows setup, see [twolfson/winfiles][winfiles].
- Create new files at a keystroke within Sublime - Package: Quick File Creator - New File = Ctrl+Alt+O
- Duplicate files via command palette + SideBarEnhancements - `File: Duplcate`
- Debug via binary search of `console.log`
- Clean up debug statements via command palette + FindPlusPlus - `Find: In Current File`
    - Set Sublime Text to always Buffer `Find in Results` to bottom panel
- Usually split Sublime into 2 panes (one for searching, the other for hacking)
- Checkout and merge previous branches via `git checkout/merge -`. See [Coderwall protips][coderwall-protips] for more.

[spectacles]: http://spectacleapp.com/
[cssm]: http://wiki.compiz.org/CCSM
[aerosnap]: http://windows.microsoft.com/en-us/windows7/arrange-windows-side-by-side-on-the-desktop-using-snap
[windowpad]: http://www.autohotkey.com/board/topic/19990-windowpad-window-moving-tool/
[winfiles]: https://github.com/twolfson/winfiles
[coderwall-protips]: https://coderwall.com/p/u/twolfson

### General purpose

- Use Unix key bindings (Ctrl+A, Ctrl+E, Ctrl+D)
- Use shortcutfoo to learn key bindings of new programs

## Installed Programs

- Sublime Text 2 with [Package Control]
    - Installed packages
      - SideBarEnhancements (for command palette file commands)
      - SideBarSync (for reveal file command palette)
      - Table Editor (for easy tables in Markdown - GFM accepted)
      - Quick File Creator (for shortcuts to create new directories and files)
      - Find in Files (for quick selection of files and better results)
      - Jade, Mustache (syntax)
      - Sublime Linter (constantly linting code)
      - Origami (for when I want some funky custom layout *rare*)
- nodemon
- node/npm
- hub - Create a new GitHub repo straight from the command line =D
- howdoi
- grunt@0.3.17
- Charles Proxy (only installed/used when acting as 3rd party script)
    - Used to modify content (injecting scripts, faking pages, etc) for hands-free and dev-friendly environment
- git-extras - Adds an extremely useful set of git commands (e.g. `git back`)

### Linux Specific

- gnome-terminal
- Quod Libet - Music tag manager

### Mac OS X Specific

- Dock view
- Spectacles

## Settings

- Key repeat: Very high
