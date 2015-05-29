# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git ruby lighthouse)
source $ZSH/oh-my-zsh.sh
plugins=(git brew osx sublime scala sbt gem svn tmux vagrant sublime screen xcode ant adb aws bower brew brew-cask bundler cake capistrano command-not-found cp debian docker emacs git-flow git-extras github gitignore knife mercurial postgres python sudo)

setopt autopushd pushdsilent pushdtohome 

# aliases
alias dc='popd'
alias g='git'
alias gs='git status'
alias ga='git add -p'
alias gb='git bam'
alias gl='git log'
alias gd='git diff'
alias gcf='git commit-file'
alias zshrc='vim ~/.zshrc; source ~/.zshrc'
alias ls='ls -al'
alias gitconfig='vim ~/.gitconfig'
alias zshenv='vim ~/.zshenv; source ~/.zshenv'
alias killJava='sudo killall -9 java'
alias killPlay='lsof -n -i4TCP:9000 | grep LISTEN | awk "/LISTEN/ {print \$2}" | xargs kill -9'

source ~/.docker

function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }
setjdk 1.8

export JDEPEND_HOME="/Applications/jdepend-2.9.1"
export CLASSPATH=$CLASSPATH:$JDEPEND_HOME/lib/jdepend-2.9.1.jar 
