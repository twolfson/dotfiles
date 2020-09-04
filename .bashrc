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
alias lock="date; sleep 1 ; xset dpms force off ; cinnamon-screensaver-command -l"

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
    echo "Usage: docker_sandbox <container_name>" 1>&2
    echo "docker_sandbox expected a name parameter. Please specify one" 1>&2
    return 1
  fi

  # Provide common commands
  echo "\`\`\`"
  echo "# Common setup commands"
  echo "apt-get update"
  echo "apt-get install -y curl wget build-essential"
  echo "## Node.js"
  echo "curl -sL https://deb.nodesource.com/setup_12.x | bash -"
  echo "apt-get install -y nodejs"
  echo "\`\`\`"

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
  ffmpeg -i recording.mov frames/recording%03d.png

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

### Bash autocompletion ###
if test -f /usr/share/bash-completion/bash_completion; then
  . /usr/share/bash-completion/bash_completion
  # DEV: Load `git-extras` directly as `bash_completion` looks for `git` and we can't figure out how to resolve it
  if test -f /usr/share/bash-completion/completions/git-extras; then
    . /usr/share/bash-completion/completions/git-extras
  fi
elif which brew &> /dev/null && test -f "$(brew --prefix)/etc/bash_completion"; then
  . "$(brew --prefix)/etc/bash_completion"
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

    // Define our replacement content
    let gittipSlashfulStr = [
      '## Donating',
      'Support this project and [others by twolfson][gittip] via [gittip][].',
      '',
      '[![Support via Gittip][gittip-badge]][gittip]',
      '',
      '[gittip-badge]: https://rawgithub.com/twolfson/gittip-badge/master/dist/gittip.png',
      '[gittip]: https://www.gittip.com/twolfson/',
    ].join('\n');
    let gittipSlashlessStr = gittipSlashfulStr.replace(
      'https://www.gittip.com/twolfson/', 'https://www.gittip.com/twolfson');
    let gratipayPngStr = [
      '## Donating',
      'Support this project and [others by twolfson][gratipay] via [gratipay][].',
      '',
      '[![Support via Gratipay][gratipay-badge]][gratipay]',
      '',
      '[gratipay-badge]: https://cdn.rawgit.com/gratipay/gratipay-badge/2.x.x/dist/gratipay.png',
      '[gratipay]: https://www.gratipay.com/twolfson/',
    ].join('\n');
    let gratipaySvgStr = gratipayPngStr.replace('/gratipay.png', '/gratipay.svg');
    let supportMeStr = [
      '## Donating',
      'Support this project and [others by twolfson][twolfson-projects] via [donations][twolfson-support-me].',
      '',
      '<http://twolfson.com/support-me>',
      '',
      '[twolfson-projects]: http://twolfson.com/projects',
      '[twolfson-support-me]: http://twolfson.com/support-me',
    ].join('\n');

    // Load in our file and replace its content
    let inputStr = fs.readFileSync('README.md', 'utf8');
    let outputStr = inputStr
      .replace(gittipSlashfulStr, supportMeStr)
      .replace(gittipSlashlessStr, supportMeStr)
      .replace(gratipayPngStr, supportMeStr)
      .replace(gratipaySvgStr, supportMeStr);

    // Write our file
    fs.writeFileSync('README.md', outputStr, 'utf8');
  "

  # Notify our user of success and next steps
  echo "Gratipay successfully removed!" 1>&2
  echo "Don't forget to search for remaining traces:" 1>&2
  echo "  git grep -i gittip" 1>&2
  echo "  git grep -i gratipay" 1>&2
}

function add_funding_yml() {
  mkdir -p .github
  echo "custom: https://twolfson.com/support-me" >> .github/FUNDING.yml
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

# Extend our bash prompt with a timer
# https://jakemccrary.com/blog/2015/05/03/put-the-last-commands-run-time-in-your-bash-prompt/
_start_run_timer() {
  # If we haven't hit the `stop` call yet, then save our start time
  # DEV: For `ms` timing, use %3N, https://serverfault.com/a/588705
  if test -z "$_run_start_time"; then
    _run_start_time="$(date '+%s')"
  fi
}
_stop_run_timer() {
  # Capture our stop time, and if we had a start time (i.e. not a new shell), then calculate our run time
  _run_stop_time="$(date '+%s')"
  last_command_time="0"
  if test -n "$_run_start_time"; then
    last_command_time="$(($_run_stop_time - $_run_start_time))"
  fi
  unset _run_start_time
  unset _run_stop_time
}
twolfson_prompt_command() {
  # Run sexy-bash-prompt first to pick up exit code
  sexy_bash_prompt_command

  # Stop our timer for now
  _stop_run_timer

  # Append to history on every prompt generation
  # DEV: By default `bash` appends on shell exit
  #   $ history --help
  #   -a	append history lines from this session to the history file
  history -a

  # If our command took over 1s to run and was an unexpected long command (usually non-interactive), then log it out
  if test "$last_command_time" -gt 1 && \
      $(history 1 | grep --invert-match -E "(pico|nano|git add|git checkout|less)" &> /dev/null); then
    echo "Command runtime: ${last_command_time}s"
  fi

  # PS1 will echo out after this
  # DEV: We could extend/replace PS1 here but meh
}
trap _start_run_timer DEBUG
PROMPT_COMMAND="twolfson_prompt_command"

# Define function to see how long it takes for program to exit
time_pid () {
  # Define configuration options
  local sleep_time=2 # seconds

  # Resolve our pid
  local pid="$1"
  if test "$pid" = ""; then
    echo "Usage: time_pid <pid>" 1>&2
    echo "Missing \`pid\` parameter. Please specify it" 1>&2
    return 1
  fi

  # Collect our program's start time
  local start_time_str="$(ps -p "$pid" -o lstart | grep --invert-match STARTED)"
  if test "$start_time_str" = ""; then
    echo "Process ${pid} isn\'t running. Double check pid" 1>&2
    return 1
  fi
  local start_time="$(date --date "${start_time_str}" '+%s')"
  echo "Process ${pid} running since ${start_time_str}"

  # Loop until our process stops
  # https://github.com/arlowhite/process-watcher
  # https://superuser.com/a/447427
  while true; do
    echo "Process ${pid} still running at $(date)"
    local last_time="$(date '+%s')"
    sleep "$sleep_time"

    if ! ps -p "$pid" &> /dev/null; then
      break
    fi
  done

  # Output our result
  echo "Process ${pid} stopped at around $(date --date "@${last_time}")"
  echo "  with total runtime of about: $((last_time - start_time)) seconds"
}

# Define function to update title
# DEV: Makes it less annoying to deal with ssh titles
title () {
  echo -ne "\033]0;$*\007"
}

# Define function to timestamp images
# DSC_0001.JPG -> 2019-09-23--DSC_0001.JPG
timestamp_images () {
  for filepath in $*; do
    # Extract our timestamp data
    #  GPS Date/Time                   : 2018:07:24 04:35:55Z -> "2018-07-24"
    timestamp="$(exiftool "$filepath" | grep "GPS Date/Time" | sed -E "s/[^:]+: ([0-9]+):([0-9]+):([0-9]+).*+/\1-\2-\3/")"
    if test -z "$timestamp"; then
      echo "Missing GPS Date/Time for $filepath" 1>&2
      return 1
    fi

    # Rename our file
    mv "$filepath" "$(dirname "$filepath")/$timestamp--$(basename $filepath)"
  done
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
export PATH="$PATH:/usr/local/heroku/bin"

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

# Custom Java version switcher
# https://docs.oracle.com/cd/E19509-01/820-3208/inst_cli_jdk_javahome_t/
function switch_to_java() {
  # Switch to our target directory
  test -n "$1" || (echo "Missing Java filepath" 1>&2 && exit 1)
  export JAVA_HOME="$1"
  export PATH="$JAVA_HOME/bin:$PATH"

  # Prepend Java version
  java_version=$(java -version 2>&1 | head -n 1 | sed -E 's/java version "([^"]+)"/\1/')
  PS1="\$(echo -n \"(Java \$java_version)\")$PS1"
}

# Enable toggling of touchscreen on the fly
function enable_touchscreen() {
  test -n "$TOUCHSCREEN_DEVICE_ID" || (echo "Missing TOUCHSCREEN_DEVICE_ID" 1>&2 && exit 1)
  xinput enable "$TOUCHSCREEN_DEVICE_ID"
}
function disable_touchscreen() {
  test -n "$TOUCHSCREEN_DEVICE_ID" || (echo "Missing TOUCHSCREEN_DEVICE_ID" 1>&2 && exit 1)
  xinput disable "$TOUCHSCREEN_DEVICE_ID"
}
function map_touchscreen_to_display() {
  # https://unix.stackexchange.com/a/439625
  test -n "$TOUCHSCREEN_DEVICE_ID" || (echo "Missing TOUCHSCREEN_DEVICE_ID" 1>&2 && exit 1)
  test -n "$TOUCHSCREEN_DISPLAY_NAME" || (echo "Missing TOUCHSCREEN_DISPLAY_NAME" 1>&2 && exit 1)
  xinput map-to-output "$TOUCHSCREEN_DEVICE_ID" "$TOUCHSCREEN_DISPLAY_NAME"
}

# If there is a private bash profile, use it
if test -f ~/.private_bash_profile; then
  source ~/.private_bash_profile
fi
