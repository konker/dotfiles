# set the trace prompt to include seconds, nanoseconds, script name and line number
## PS4='+$(date "+%s:%N") %N:%i> '
# save file stderr to file descriptor 3 and redirect stderr (including trace 
# output) to a file with the script's PID as an extension
## exec 3>&2 2>/tmp/startlog.$$
# set options to turn on tracing and expansion of commands contained in the prompt
## setopt xtrace prompt_subst



DISABLE_AUTO_UPDATE="true"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="fino"
ZSH_THEME="steeef"
#ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias lsusb="system_profiler SPUSBDataType"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source ~/.profile

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# turn off tracing
## unsetopt xtrace
# restore stderr to the value saved in FD 3
## exec 2>&3 3>&-

export NVM_DIR="/home/konker/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
