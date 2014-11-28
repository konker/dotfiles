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
#[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && . "/usr/local/bin/virtualenvwrapper.sh"  # This loads python virtualenvwrapper into a shell session.

alias cls=clear

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
