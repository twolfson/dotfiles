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
    - Includes list of commonly used packages in [Package Control.sublime-settings](.config/sublime-text-2/Packages/User/Package Control.sublime-settings)
- `.fonts/anonymous+Pro-Powerline.ttf` - [Anonymous Pro][], a monospaced font with serifs
    - This font comes from [powerline][] which contains additional characters. However, I don't use them.
- `.gitconfig`
    - Set up credentials for `twolfson` (me)
    - Disable creation of `.orig` files
    - Set `meld` as mergetool/difftool
    - Enable `git` colors
    - Add aliases
        - `add-pr` - Adds a new `remote` for fetching pull requests as branches
        - `amend` - Update previous commit
        - `git` - For chaining of multiple `git's` (e.g. `git git status`)
- `.gconf` - Configurations for Gnome (e.g. Ctrl+Alt+Del for `gnome-system-monitor`)
- `.nanorc` - Adds syntax highlighting for `nano`

[Sublime Text 2]: http://www.sublimetext.com/2
[Anonymous Pro]: http://www.marksimonson.com/fonts/view/anonymous-pro
[powerline]: https://github.com/milkbikis/powerline-shell

##### `.bashrc` aliases
- `inco` - Opens a Chrome Incognito window
- `lock` - Locks computer via screensaver on Gnome/Cinnamon
- `volume` - Control sound output

#### Directory movements
- `cd` - Moved to directory and pushes onto directory stack (via `pushd`)
- `..`, [...], `.....` - Navigate up one, [...], five directories (via `pushd`)
- `~` - Navigate to the home directory (via `pushd`)
- `,,`, [...], `,,,,,` - Navigate back one, [...], five directories (in the `pushd` stack via `popd`)
- `,` - List out current `pushd`/`popd` stack
- `copy` - Aliases for consistent copying functionality across Linux Mint and OSX

## Programs
- [Sublime Text 2][] with [Package Control][], text editor with great plugin system and ecosystem
    - [SideBarEnhancements][], adds a bunch of file system comands to command palette
    - [SyncedSideBar][], adds command to reveal current file in side bar (expands folder structure)
    - [Table Editor][], edit Markdown tables easily (GFM compatible)
    - [Quick File Creator][], adds shortcuts for creating new directories and files
    - [Find++][], adds commands for searching project, current file, or all open files
    - Any syntax file I work with (e.g. `Jade`, `SASS`)
    - [SublimeLinter][], lints Python and JavaScript on every save
    - [Origami][], rearranges files betweens panes
    - [snippet-destroyer][], removes all snippet autocompletes for consistent `tab` functionality
    - [CodeFormatter][], beautifies a JavaScript or Python file
    - [Pretty JSON][], beautifies a JSON file
    - [Githubinator][], open [GitHub][] browse and blame for the active file
    - [Phabricator][subl-phab], open [Phabricator][] browse for the active file
    - [Insert Nums][], inserts an ordered list of numbers at each cursor position
    - [InsertDate][], insert a date string
        - Used for article timestamping
    - [Markdown Extended][] and [Monokai Extended][], extended syntax highlighting to support GitHub Flavored Markdown
    - [Case Conversion][], switch between various cases easily
    - [CanISwitchToSublimeText3][], determine if all my plugins are ready to upgrade to [Sublime Text 3][]
    - [Maybs Quit][], prevent accidental exits by adding prompt to `ctrl+q`
- [nodemon][], watches `.js` files for changes and re-executes a script
    - Great for restarting local development servers on save
- [listen-spawn][], listens for HTTP requests and re-executes a script
    - Great for tests when used in junction with [Hooks][] and [Request][] in [Sublime Text][]
- [livereload][], automatically refresh browser when a file is updated
- [hub][], adds more [GitHub][] commands (e.g. repo creation, open current repo in browser)
- [howdoi][], look up StackOverflow answers from the command line
- [Charles Proxy][], inject scripts and fake pages when developing against 3rd party sites
- [git-extras][], adds bonus `git` commands (e.g. `git back` to reset previous commit, `git ignore` to add a file pattern to `.gitignore`)
- [Google Music][], music player hosted by Google
- [Pixlr][], [Photoshop][] from the browser
- [Firefox][] with [Firebug][], browser and development tool of choice
- [Vagrant][], create and teardown development virtual machines on the fly
- [ievms][], installs Internet Explorer virtual machines
- [VirtualBox][], virtual machine runtime
- [nano][], small and intuitive text editor that I use for `git commit` messages
- [Gmail][] with labs plugins, Google's mail program
    - Keyboard shortcuts, key bindings to navigate and categorize emails
    - Undo, allows me to undo an accidental archive action
    - Favicon, view unread email count in favicon
- [Shortcut Foo][], flash cards for program shortcuts
- [grunt-init-node][], prompt style boilerplate for `node` modules
- [gti][], "alias" similar to `sl` for `ls` that plays GTI animation but runs `git command afterwards

[SideBarEnhancements]: https://github.com/titoBouzout/SideBarEnhancements
[SyncedSideBar]: https://github.com/sobstel/SyncedSideBar
[Table Editor]: https://github.com/vkocubinsky/SublimeTableEditor
[Quick File Creator]: https://github.com/noklesta/SublimeQuickFileCreator
[Find++]: https://github.com/twolfson/FindPlusPlus
[SublimeLinter]: https://github.com/SublimeLinter/SublimeLinter
[Origami]: https://github.com/SublimeText/Origami
[snippet-destroyer]: https://github.com/twolfson/sublime-snippet-destroyer
[CodeFormatter]: https://github.com/akalongman/sublimetext-codeformatter/
[Pretty JSON]: https://github.com/dzhibas/SublimePrettyJson
[GitHubinator]: https://github.com/ehamiter/ST2-GitHubinator
[GitHub]: http://github.com/
[subl-phab]: https://github.com/uber/sublime-phabricator
[Phabricator]: https://github.com/facebook/phabricator
[Insert Nums]: https://github.com/jbrooksuk/InsertNums
[InsertDate]: https://github.com/FichteFoll/sublimetext-insertdate
[Markdown Extended]: https://github.com/jonschlinkert/sublime-markdown-extended
[Monokai Extended]: https://github.com/jonschlinkert/sublime-monokai-extended
[Case Conversion]: https://github.com/jdc0589/CaseConversion
[CanISwitchToSublimeText3]: https://github.com/SublimeGit/CanISwitchToSublimeText3
[Sublime Text 3]: http://www.sublimetext.com/3
[Maybs Quit]: https://github.com/xavi-/sublime-maybs-quit
[nodemon]: https://github.com/remy/nodemon
[listen-spawn]: https://github.com/twolfson/listen-spawn
[Hooks]: https://github.com/twolfson/sublime-hooks
[Request]: https://github.com/twolfson/sublime-request
[Sublime Text]: http://www.sublimetext.com/
[livereload]: https://github.com/lepture/python-livereload
[hub]: https://github.com/defunkt/hub
[howdoi]: https://github.com/gleitz/howdoi
[Charles Proxy]: http://charlesproxy.com/
[git-extras]: https://github.com/visionmedia/git-extras
[Google Music]: http://music.google.com/
[Pixlr]: http://pixlr.com/
[Photoshop]: http://www.photoshop.com/
[Firefox]: http://www.mozilla.org/en-US/firefox/new/
[Firebug]: https://getfirebug.com/
[Vagrant]: http://vagrantup.com/
[ievms]: https://github.com/xdissent/ievms/
[VirtualBox]: http://virtualbox.org/
[nano]: http://www.nano-editor.org/
[Gmail]: https://mail.google.com/
[Shortcut Foo]: http://shortcutfoo.com/
[grunt-init-node]: https://github.com/twolfson/grunt-init-node
[gti]: https://github.com/rwos/gti

### Linux Specific
- `gnome-terminal`, terminal emulator for Gnome
- [Amarok][], music player for Linux
- [Quod Libet][], manage music library tags
- [wmctrl-pad][], manage window positions and layout
    - Integrates nicely with keyboard shortcuts
- [gnome-pie][], cursor based launcher
    - Useful for GUI tasks like quick launching screenshot selection

[Amarok]: http://amarok.kde.org/
[Quod Libet]: https://code.google.com/p/quodlibet/
[wmctrl-pad]: https://github.com/twolfson/controlpad
[gnome-pie]: https://github.com/Simmesimme/Gnome-Pie

### Mac OS X Specific
- `Terminal`, OSX built in terminal
- [DockView][], adds badge for how many windows are open for a program
- [Spectacle][], adds shortcuts to position windows
- [Alfred][], makes actions more accessible (e.g. `lock`)
- [Go2Shell][], open a shell via button in Finder window

[DockView]: http://www.macworld.com/product/682136/dockview.html
[Spectacle]: http://spectacleapp.com/
[Alfred]: http://www.alfredapp.com/
[Go2Shell]: https://itunes.apple.com/us/app/go2shell/id445770608?mt=12

## Workflow
- Key repeat is set to very high
- Use multiple monitors, layout to see everything at a glance
    - Move windows around via shortcuts; [Spectacle][] (Mac OS X), [wmctrl-pad][] (Gnome)
- Create new files via a shortcut
    - 'Quick File Creator' inside Sublime Text
- Duplicate files files in one command
    - 'File: Duplcate' via [SideBarEnhancements][] inside Sublime Text
- When debugging a problem, I use a binary search of `console.log` statements
- When finding methods/strings in foreign code bases, I use 'Find: In Current File' via [Find++][] in Sublime Text
    - Alternatively, I use `git grep` to search the `git` filesystem
- Checkout and merge previous branches via `git checkout/merge -`. See [Coderwall protips][] for more.
- I use live coding frequently in multiple scenarios
    - [nodemon][] to reload local node servers whenever a `.js` file changes
    - [livereload][] in combination with [Hooks][] and [Request][] in Sublime Text to trigger actions (e.g. `npm test`) on save
    - More information can be found at http://twolfson.com/2013-07-27-develop-faster
- Open [GitHub][] and [Phabricator][] from Sublime Text via [Githubinator][] and [Phabricator][subl-phab] plugins
- Create new repos in [GitHub][] via [hub][]
- Create templated repos via [grunt-init-node][]
- Learn program shortcuts early on (e.g. `bash`, `less`)
    - Use [Shortcut Foo][] to learn key bindings of new programs
- Inside [Sublime Text][], multiple word selection is great for deleting a single word as well as adjusting multiple

[Coderwall protips]: https://coderwall.com/p/u/twolfson

## Donating
Support this project and [others by twolfson][gittip] via [gittip][].

[![Support via Gittip][gittip-badge]][gittip]

[gittip-badge]: https://rawgithub.com/twolfson/gittip-badge/master/dist/gittip.png
[gittip]: https://www.gittip.com/twolfson/

## Unlicense
As of Feb 28 2014, Todd Wolfson has released this repository and its contents to the public domain.

It has been released under the [UNLICENSE][].

[UNLICENSE]: UNLICENSE
