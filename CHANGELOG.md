# dotfiles changelog
## 2016.0214.2019 (Feb 14, 2016 08:19PM)
- Moved to consistent `test` based conditionals
- Cleaned up unnecessary `$` variables from aliases
- Repaired error handling in `ssh_tunnel`
- Added Sublime Text OS X shortcuts
- Added `pus` git alias for `push`

## 2016.0214.1953 (Feb 14, 2016 07:53PM)
- Added ColorHelper plugin for Sublime Text

## 2016.0210.2042 (Feb 10, 2016 08:42PM)
- Set `nano` as default editor
- Updated Gnome-Pie configuration

## 2015.1223.0217 (Dec 23, 2015 02:17AM)
- Added chruby integration
- Added experimental `git ls-files` integration with `Find++`
- Added INI syntax to Sublime Text packages

## 2015.1117.2131 (Nov 17, 2015 09:31PM)
- Updated Sublime Text "Directory Preferences" command to tolerate no newline at EOF

## 2015.1114.1523 (Nov 14, 2015 03:22PM)
- Removed leftover binary file from `victorious-git` transition

## 2015.1114.1522 (Nov 14, 2015 03:22PM)
- Moved from custom `git` hooks to `victorious-git`

## 2015.1114.1509 (Nov 14, 2015 03:09PM)
- Added `add_foundry` bash command to `.bashrc`
- Updated `gnome-pie` settings
- Removed "Terminal: Open" command from Sublime Text
    - Superceded by same command in package itself
- Added "Directory Preferences" package and "Directory Preferences: Ignore trailing whitespace" command to Sublime Text
    - This will assist when working in one-off projects that have trailing whitespace
- Added "ChangeQuotes" package to Sublime Text
- Added `calculate_gzip: true` to StatusBarFileSize to calculate GZIP file size of pacakges
    - Currently implementation exists only as a fork/PR
- Added timezone for Insert Date package in Sublime Text
- Disabled mouse support in `nano`

## Non-time based releases
0.90.2 - Added ignore for node_modules

0.90.1 - Added foundry for release

0.90.0 - Enabled mouse support in nano

0.89.0 - Added "git shortref" alias

0.88.0 - Updated gnome-terminal settings

0.87.1 - Added gnome-terminal to install script

0.87.0 - Updated gnome-terminal settings

0.86.0 - Updated Sublime Text packages

0.85.0 - Added `ssh-tunnel` command

0.84.0 - Moved to dynamic symlinked git-template-dir with hooks

0.83.0 - Moved SublimeLinter to be enabled by default

0.82.1 - Fixed up variables for fanfare hooks

0.82.0 - Updated fanfare git hooks to support git@2

0.81.0 - Updated Sublime Text 3 configuration

0.80.0 - Added `add-remote-pr` git alias to handle upstream PRs easier

0.79.0 - Added more config updates from living with Sublime Text 3

0.78.0 - Finding Sublime Text 3 plugins and commands

0.77.0 - Set up SublimeLinter for Sublime Text 3

0.76.0 - Set up more of Sublime Text 3

0.75.0 - Getting started with basic Sublime Text 3 setup

0.74.0 - Removed gnome-pie log and added log ignore

0.73.0 - Added gnome-pie to configuration and list of applications

0.72.0 - Updated latest Sublime Text 2 settings

0.71.0 - Updated latest Sublime Text 2 settings

0.70.0 - Updated font preferences

0.69.1 - Added missing files to last release

0.69.0 - Added mixed Sublime Text updates

0.68.0 - Added `grunt-completion` to `.bashrc`

0.67.0 - Updated Sublime Text packages and settings

0.66.0 - Added active guide for Sublime Text

0.65.0 - Fixed alias for branch to match `sexy-bash-prompt` updates

0.64.0 - Moved `virtualenvwrapper` behind conditional

0.63.0 - Added `hex-practice` alias for easier practice

0.62.0 - Added `JSON` syntax for `.jscsrc` files

0.61.0 - Added simpler set of bash symbols for `getty` sessions

0.60.0 - Added `gt` alias for `gti` (typo intentional)

0.59.0 - Added latest set of Sublime Text updates

0.58.0 - Added `igt` alias for `git`

0.57.0 - Added `alias` for process management

0.56.0 - Moved to `Edit Command Palette` rename

0.55.0 - Added `SelectUntil` command

0.54.0 - Updated Sublime settings to include keymap notes and custom user commands

0.53.0 - Added function to make updating terminal title easier

0.52.0 - Replaced `gti` alias with `git` correcting animation

0.51.0 - Fixed up `bash --posix` invocation issues with `.bashrc`

0.50.0 - Committing latest set of changes for Sublime Text

0.49.0 - Added better error messaging for fanfare issues

0.48.0 - Fixed up cross platform fanfare issues

0.47.0 - Updated Sublime Text settings

0.46.0 - Added out of date installation files found during a cleanup

0.45.0 - Updated `grunt-init` defaults

0.44.0 - Added latest Sublime Text 2 updates

0.43.0 - Added linuxbrew to .bashrc

0.42.0 - Fixed up coloring to be better in TTY shells

0.41.0 - Altered `victorious-merge` to only sound when we triumphed a conflict

0.40.0 - Moved to `victorious-merge` for git template

0.39.1 - Added comments to `.gitconfig` for future reference

0.39.0 - Added line numbers to `git grep` and alias to get authors in a log quickly

0.38.0 - Updated documentation and added UNLICENSE

0.37.0 - Removed more unnecessary Sublime Text files

0.36.0 - Added better backup for Sublime Text configuration

0.35.0 - Removed forgotten `git-sqwish` autocomplete

0.34.0 - Moved all of install script into conditionals

0.33.0 - Removed abstracted `sexy-bash-prompt` and `git-sqwish` files

0.32.0 - Documenting and cleaning up `.gitconfig` and `.bashrc`

0.31.1 - Added missing conditional `.private_bash_profile` inside `~/.bash_profile`

0.31.0 - Added `.private_bash_profile` support

0.30.0 - Added git alias from dif to diff

0.29.0 - Adjusted vagrant-listen-spawn to handle multi-Vagrant setups

0.28.0 - Added commands to make node/listen-spawn installs easier on Vagrant

0.27.0 - Added listen-spawn tunnel for Vagrant

0.26.0 - Stopping annoying ssh TERM errors

0.25.0 - Added `volume` command for Linux Mint

0.24.0 - Moved to `current` as `push` model for `git. This fixes the `--set-upstream` message we would see

0.23.0 - Added git alias to clone gists easier

0.22.0 - Moved TERM output from .bash_prompt to .bashrc

0.21.0 - Added say command for Linux

0.20.0 - Added tag aliases

0.19.0 - Added .nanorc for bash syntax highlighting

0.18.0 - Added tab completable exit code output

0.17.1 - Fix for Travis CI logic

0.17.0 - Made cross-platform command to alias copying

0.16.0 - Added fallback for `scripts` in `package.json` build step

0.15.0 - Added Travis username default for grunt-init

0.14.0 - Added `git ad` as an alias for `git add`

0.13.1 - Fixes for pre/post release scripts for Python

0.13.0 - Added pre/post release scripts for Python

0.12.0 - Set `meld` as default mergetool for git

0.11.0 - Added bash completion for git-sqwish

0.10.0 - Added Python virtualenvs

0.9.0 - Added `amend` to gitconfig and vendor-specific bashrc/gitconfig updates

0.8.0 - Added convenience check to not run `npm publish` on private repos

0.7.0 - Added `bower.json` and `component.json` updates to git-release

0.6.0 - Added `npm run build` on git-release

0.5.0 - Moved `grunt-init-node` to standalone fork

0.4.0 - Moved from `grunt init` (`grunt@0.3`) to `grunt-init` (`grunt@0.4`)

0.3.0 - Added `unpulled` state to bash prompt, giving it 4 more statuses.

0.2.1 - Created `demo.sh` for showing off sexy bash script and updated screenshot

0.2.0 - Added test suite against bash prompt

0.1.0 - See `git log`
