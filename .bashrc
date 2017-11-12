#!/usr/bin/env bash
### Common commands ###
# Open an incognito window in Chrome
if test "$(ls /Applications/Google\ Chrome.app 2> /dev/null)" != ""; then
  alias inco="open -a /Applications/Google\\ Chrome.app --args --incognito"
else
  alias inco="google-chrome --incognito"
fi

# Mimic OSX's `say` command on Linux
if which festival &> /dev/null; then
  function say() {
    echo "(SayText \"$*\")" | festival --pipe
  }
fi

# Adjust volume easily
if which pactl &> /dev/null; then
  alias volume="pactl -- set-sink-volume 1"
fi

# Lock the computer
alias lock="date; sleep 1 ; xset dpms force off ; gnome-screensaver-command -l"

### Directory movements ###
# cd is now pushd ;D
alias    cd="pushd             > /dev/null"

# .. brings you up one level, ... is two levels, etc.
# Additionally, these are added to the directory stack
alias    ..="pushd ..          > /dev/null"
alias   ...="pushd ../..       > /dev/null"
alias  ....="pushd ../../..    > /dev/null"
alias .....="pushd ../../../.. > /dev/null"

# ~ brings you to your home directory and adds it to the directory stack
alias     ~="pushd ~ > /dev/null"

# ,, brings you to the last directory. ,,, brings you to the second to last directory, etc.
alias    ,,="popd    > /dev/null"
alias   ,,,=",,   && ,,"
alias  ,,,,=",,,  && ,,"
alias ,,,,,=",,,, && ,,"

# , echoes out the current directory stack
alias     ,="dirs -l -v"

### Node aliases ###
# npm without 304 requests. Perfect for offline use!
alias lnpm="npm --no-registry"

### Process management aliases ###
alias fu="fuck you"

### Date/Time helpers ###
alias epoch="date +%s"

### Typos suck ###
alias gi="git" # Works great with git config help.autocorrect
# Replaced `gti` with https://github.com/rwos/gti (speed 100)
export GTI_SPEED=2000
alias gt="gti"
alias tgi="git"
alias igt="git"

### Clipboard help ###
if which pbcopy &> /dev/null; then
  alias copy="pbcopy"
else
  alias copy="xclip -selection c"
fi

### Consistent sorting command ###
if which gsort &> /dev/null; then
  alias sort="gsort"
fi

### Enable aliases to be `sudo`ed ###
# Taken from https://coderwall.com/p/lyutxw
alias sudo="sudo "

### Vagrant commands ###
alias install-node="if ! which node &> /dev/null; then sudo apt-get install -y python-software-properties python g++ make; sudo add-apt-repository -y ppa:chris-lea/node.js; sudo apt-get update; sudo apt-get install -y nodejs; fi"
alias install-listen-spawn="vagrant-install-node; if ! which listen-spawn &> /dev/null; then sudo npm install -g listen-spawn; fi"
vagrant_listen_spawn () {
  echo "Connected to $1 localhost:7060"
  vagrant ssh $1 -- -N -L 7060:localhost:7060
}
alias vagrant-listen-spawn="vagrant_listen_spawn"

### SSH commands ###
ssh_tunnel () {
  # Load in our parameters
  server="$1"
  if test "$server" = ""; then
    echo "\`ssh_tunnel\` requires \`server\` to be passed in but it was empty" 1>&2
    return 1
  fi
  remote_port="$2"
  if test "$remote_port" = ""; then
    echo "\`ssh_tunnel\` requires \`remote_port\` to be passed in but it was empty" 1>&2
    return 1
  fi
  local_port="$3"
  if test "$local_port" = ""; then
    # Fallback our local port to the same as the remote port
    local_port="$remote_port"
  fi

  # Run our command
  echo "Opened SSH tunnel on $server:$remote_port to localhost:$local_port"
  ssh -N -L "$local_port:localhost:$remote_port" "$server"
}
alias ssh-tunnel="ssh_tunnel"

### Sandbox utility ###
function docker_sandbox() {
  # Load in our parameters
  name="$1"
  if test "$name" = ""; then
    echo "docker_sandbox expected a name parameter. Please specify one" 1>&2
    return 1
  fi

  # Provide common commands
  echo "# Common setup commands"
  echo "sudo apt-get update"
  echo "sudo apt-get install -y curl wget build-essential"
  echo "## Node.js"
  echo "curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -"
  echo "sudo apt-get install -y nodejs"

  # Start a Docker instance
  docker run -it --volume "$PWD:/vagrant" --name "$name" ubuntu:14.04 /bin/bash
}

### Hexadecimal practice for my current level ###
alias hex-practice="hexadecimal-practice --maximum-digits 1"

### Screencast customization ###
# DEV: Force 2x2 selection since our computer can only record at divisors of 2
alias record-a-cast="record-a-cast --height-divisor 2 --width-divisor 2"
function record_a_gif() {
  # Navigate to a temporary directory
  cd "$(mktemp -d)"

  # Ignore SIGINT yet magically forward it to child processes (e.g. `FFmpeg`)
  # DEV: We need to do this sing `FFmpeg` only stops on SIGINT but it kills our bash script too
  trap "true" SIGINT

  # Prompt to record a video
  # DEV: We use `-r 10` for 10FPS since GIFs are slooow
  echo "Starting recording..." 1>&2
  record-a-cast recording.mov -- -r 10

  # Wait for our script to stop encoding
  echo "Waiting for avconv to stop running..." 1>&2
  sleep 0.5

  # Break down our movie into frames
  echo "Extracting frames..." 1>&2
  mkdir frames
  avconv -i recording.mov frames/recording%03d.png

  # Combine our frames into a GIF and open it
  echo "Generating GIF..." 1>&2
  convert -loop 0 frames/recording*.png recording.gif
  xdg-open recording.gif

  # Prompt ourselves with commands to edit it
  echo "GIF generation complete" 1>&2
  echo "To edit the frames, run: \`nemo frames\`" 1>&2
  echo "To generate new GIF, run: \`convert -loop 0 frames/recording*.png recording.gif\`" 1>&2
  echo "To crop a GIF, use Imgur or run: \`convert -crop 100x120+550+330 -page 0x0+0+0 recording.gif recording.cropped.gif\`" 1>&2
}
alias record-a-gif="record_a_gif"

### Git autocompletion ###
if test -x /usr/local/git/contrib/completion/git-completion.bash; then
  . /usr/local/git/contrib/completion/git-completion.bash
elif which brew &> /dev/null && test -f "$(brew --prefix)/etc/bash_completion"; then
  . "$(brew --prefix)/etc/bash_completion"
fi

if test -x /etc/bash_completion.d/git-extras; then
  . /etc/bash_completion.d/git-extras
fi

if test -x /etc/bash_completion.d/git-sqwish; then
  . /etc/bash_completion.d/git-sqwish
fi

### Fabric bash completion ###
# Taken from http://rubayeet.wordpress.com/2012/03/26/tab-completion-for-fabric-tasks-on-os-x/
function _fab_complete() {
    local cur
    if [ -f "fabfile.py" ]; then
        cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=( $(compgen -W "$(fab -F short -l)" -- ${cur}) )
        return 0
    else
        # no fabfile.py found. Don't do anything.
        return 1
    fi
}
complete -o nospace -F _fab_complete fab

### Grunt bash completion ###
if which grunt &> /dev/null; then
  eval "$(grunt --completion=bash)"
fi

### foundry setup helpers ###
# Invocation: `add_foundry git npm bower`
function add_foundry() {
  # Set up our default variables
  npm_packages="foundry"
  release_commands=""

  # For each of the repos (e.g. `git`, `npm`)
  for repo in $*; do
    # Add it to our packages (e.g. `foundry` -> `foundry foundry-release-git`)
    npm_packages="$npm_packages foundry-release-$repo"

    # Add it to our release commands (e.g. `'foundry-release-git',` -> `'foundry-release-git', 'foundry-release-npm',`)
    # DEV: This will become JSON later on when we add braces
    release_commands="$release_commands 'foundry-release-$repo',"
  done

  # Create our JSON (e.g. `'foundry-release-git',` -> `['foundry-release-git',]`
  release_commands="[$release_commands]"

  # Run our install commands (e.g. `npm install foundry`)
  npm install $npm_packages --save-dev
  node -e "var pkg = require('./package.json'); pkg.foundry = {'releaseCommands': $release_commands}; require('fs').writeFileSync('package.json', JSON.stringify(pkg, null, 2));"
}

### eslint setup helpers ###
# Invocation: `add_eslint`
function add_eslint() {
  # Add a standard ESLint config
  cp ~/github/twolfson.com/.eslintrc.js .eslintrc.js

  # Install our ESLint package
  npm install eslint eslint-config-twolfson --save-dev

  # Update our package.json settings
  node -e "
    var pkg = require('./package.json');
    if (pkg.scripts.precheck) {
      pkg.scripts.precheck = pkg.scripts.precheck.replace('twolfson-style precheck', 'eslint');
    }
    require('fs').writeFileSync('package.json', JSON.stringify(pkg, null, 2));
  "
  node -e "
    var pkg = require('./package.json');
    if (pkg.scripts.lint) {
      pkg.scripts.lint = pkg.scripts.lint.replace('twolfson-style lint', 'eslint') + ' --max-warnings 0';
    }
    require('fs').writeFileSync('package.json', JSON.stringify(pkg, null, 2));
  "
  node -e "
    var pkg = require('./package.json');
    if (pkg.scripts.pretest && pkg.scripts.pretest === 'twolfson-style install') {
      delete pkg.scripts.pretest;
    }
    require('fs').writeFileSync('package.json', JSON.stringify(pkg, null, 2));
  "

  # Remove our old configs/packages
  rm .jscsrc .jshintrc
  npm uninstall jshint jscs twolfson-style --save-dev

  # Notify our user of success and next steps
  echo "ESLint transition complete!" 1>&2
  echo "Don't forget to remove any existing JSHint/JSCS rules:" 1>&2
  echo "  git grep -i jscs" 1>&2
  echo "  git grep -i jshint" 1>&2
  echo "  git grep -i twolfson-style" 1>&2
}

### README configuration helpers ###
function remove_gratipay() {
  # Perform our replacements
  node --eval "
    // Load in our dependencies
    const fs = require('fs');

    // Load in our file and replace its content
    let inputStr = fs.readFileSync('README.md', 'utf8');
    let outputStr = inputStr
      .replace([
        '## Donating',
        'Support this project and [others by twolfson][gittip] via [gittip][].',
        '',
        '[![Support via Gittip][gittip-badge]][gittip]',
        '',
        '[gittip-badge]: https://rawgithub.com/twolfson/gittip-badge/master/dist/gittip.png',
        '[gittip]: https://www.gittip.com/twolfson/',
      ].join('\n'), [
        '## Donating',
        'Support this project and [others by twolfson][twolfson-projects] via [donations][twolfson-support-me].',
        '',
        '<http://twolfson.com/support-me>',
        '',
        '[twolfson-projects]: http://twolfson.com/projects',
        '[twolfson-support-me]: http://twolfson.com/support-me',
      ].join('\n'));

    // Write our file
    fs.writeFileSync('README.md', outputStr, 'utf8');
  "

  # Notify our user of success and next steps
  echo "Gratipay successfully removed!" 1>&2
  echo "Don't forget to search for remaining traces:" 1>&2
  echo "  git grep -i gittip" 1>&2
  echo "  git grep -i gratipay" 1>&2
}

# Set fake brightness (non-hardware)
# http://askubuntu.com/a/149264
function set_fake_brightness() {
  xrandr --output LVDS-0 --brightness "$1"
}

# Define `nano` as our default `EDITOR`
export EDITOR="nano"

# Disable XON/XOFF key bindings so we can use forward history traversal
# DEV: `-` settings in`stty` disables them. You can verify this via `stty --all`
#   Initial attribution to: https://www.blockloop.io/mastering-bash-and-terminal#repeat-commands
#   http://unix.stackexchange.com/a/12108
stty -ixon

# Append to history on every prompt generation
# DEV: By default `bash` appends on shell exit
PROMPT_COMMAND="history -a"

# Set up timestamping for bash history
# 2016-12-26T12:50:00-0800
HISTTIMEFORMAT="%FT%T%z "

# If we are in an xterm and we can support 256 colors, do it
# DEV: This is used to get better colors in sexy-bash-prompt
if test "$TERM" = "xterm" && infocmp xterm-256color &> /dev/null; then
  export TERM="xterm-256color"
# Otherwise, if we are in a `linux` terminal (e.g. getty) use a simpler set of symbols
elif test "$TERM" = "linux"; then
  PROMPT_SYNCED_SYMBOL=""
  PROMPT_DIRTY_SYNCED_SYMBOL="*"
  PROMPT_UNPUSHED_SYMBOL="↑"
  PROMPT_DIRTY_UNPUSHED_SYMBOL="*↑"
  PROMPT_UNPULLED_SYMBOL="↓"
  PROMPT_DIRTY_UNPULLED_SYMBOL="*↓"
  PROMPT_UNPUSHED_UNPULLED_SYMBOL="*↑↓"
  PROMPT_DIRTY_UNPUSHED_UNPULLED_SYMBOL="*↑↓"
fi

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt

# Define function to update title
# DEV: Makes it less annoying to deal with ssh titles
title () {
  echo -ne "\033]0;$*\007"
}

# Expose helper method for git branch
function BRANCH() {
  echo $(sexy_bash_prompt_get_git_branch)
}

if test -d "$HOME/bin"; then
  PATH="$PATH:$HOME/bin" # Add ~/bin to PATH for scripting
fi
if test -d "$HOME/.rvm/bin"; then
  PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi
if test -d "/usr/local/go/bin"; then
  PATH="$PATH:/usr/local/go/bin" # Add Go to path
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## Python virtualenvs
if test -f /usr/local/bin/virtualenvwrapper.sh; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/Devel
  source /usr/local/bin/virtualenvwrapper.sh
fi

# Added by travis gem
if test -f ~/.travis/travis.sh; then
  source ~/.travis/travis.sh
fi

# If there is linuxbrew, add it to PATH/LD_LIBRARY_PATH
if test -d ~/.linuxbrew; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

# If there is chruby
if test -f /usr/local/share/chruby/chruby.sh; then
  # Load it
  source /usr/local/share/chruby/chruby.sh

  # Prepend "(Ruby 2.2.3)" whenever we use `chruby`
  PS1="\$(test -n \"\$RUBY_VERSION\" && echo -n \"(Ruby \$RUBY_VERSION)\")$PS1"
fi

# If there is a private bash profile, use it
if test -f ~/.private_bash_profile; then
  source ~/.private_bash_profile
fi
