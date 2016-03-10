export PATH=$PATH:~/bin

# git
#export PATH=$PATH:/usr/local/git/bin

# postgresql
export PATH=$PATH:/usr/local/pgsql/bin
export PGDATA=/usr/local/pgsql/data

# IAM tools
export AWS_IAM_HOME=~/bin/IAMCli-1.2.0
export PATH=$PATH:$AWS_IAM_HOME/bin

# EC2 tools
export EC2_HOME=~/bin/ec2-api-tools-1.4.1.2
export PATH=$PATH:$EC2_HOME/bin

# ELB tools
export AWS_ELB_HOME=~/bin/ElasticLoadBalancing-1.0.11.1
export PATH=$PATH:$AWS_ELB_HOME/bin

# JAVA
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

# mysql
export PATH=/usr/local/mysql/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# nodejs
export PATH=$HOME/local/node/bin:$PATH

# npm
export PATH=$PATH:/usr/local/share/npm/bin

# android
export ANDROID_HOME=~/SDK/android-sdk
export ANDROID_SDK=~/SDK/android-sdk
export PATH=$PATH:~/SDK/android-sdk/tools
export PATH=$PATH:~/SDK/android-sdk/tools
export PATH=$PATH:~/SDK/android-sdk/platform-tools
export PATH=$PATH:~/SDK/android-ndk
export USE_CCACHE=1

# android ndk
export NDK_ROOT="~/SDK/android-ndk"

# OpenCV android
export OPENCV_ROOT="~/SDK/OpenCV-android-sdk"

# homebrew
#export PATH=/usr/local/bin:$PATH

export EDITOR=vi

# Python
#export PYTHONPATH=$PYTHONPATH:~/WORKING/fusion/peerscape/v3/:~/WORKING/fusion/peerscape/v3/extras/
export WORKON_HOME=~/ENVS
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && . "/usr/local/bin/virtualenvwrapper.sh"  # This loads python virtualenvwrapper into a shell session.

ESCPRE="\ePtmux;\e"
ESCPOST="\e\\"
if [ -z "$TMUX" ]; then
    ESCPRE=""
    ESCPOST=""
fi

BGESC="$ESCPRE\033]11;%s\a$ESCPOST"
BGESC_B="$ESCPRE\033]11;black\a$ESCPOST"
BGESC_G="$ESCPRE\033]11;darkgreen\a$ESCPOST"
BGESC_R="$ESCPRE\033]11;darkred\a$ESCPOST"

alias cls=clear
alias xop=xdg-open
alias say=espeak
alias gls="git status"
alias flashsleep="sleep 0.25"
alias flashred="echo -n '$BGESC_R' ; flashsleep ; echo -n '$BGESC_B'"
alias flashgreen="echo -n '$BGESC_G' ; flashsleep ; echo -n '$BGESC_B'"

alias cyn="flashgreen ; flashsleep ; flashgreen ; espeak \"Compilartus maximus your nerdiness\""
alias iyn="flashgreen ; flashsleep ; flashgreen ; espeak \"Installed your nerdiness\""
alias tyn="flashgreen ; flashsleep ; flashgreen ; espeak \"Tested, your nerdiness\""
alias byn="flashred ;   flashsleep ; flashred ;   espeak \"Bugger, your nerdiness\""
alias tit="printf '$ESCPRE\033]0;%s\a$ESCPOST'"
alias vim="~/bin/neovim/bin/nvim -u ~/.vimrc"
alias vi="vim"
alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
unset GREP_OPTIONS

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# nvm
export NVM_DIR=$HOME/.nvm
[ -s $NVM_DIR/nvm.sh ] && . $NVM_DIR/nvm.sh # This loads NVM

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
