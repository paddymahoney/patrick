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
plugins=(git ruby rails aws)
setopt autopushd pushdsilent pushdtohome

# aliases
alias dc='popd'
alias g='git'
alias gs='git status'
alias ga='git add -p'
alias gb='git bam'
alias gl='git log'
alias glr='git lr'
alias gd='git diff'
alias gcf='git commit-file'
alias grod='git fetch && git rebase -i origin/develop'
alias zshrc='vim ~/.zshrc; source ~/.zshrc'
alias ls='ls -al'
alias gitconfig='vim ~/.gitconfig'
alias zshenv='vim ~/.zshenv; source ~/.zshenv'
alias killJava='sudo killall -9 java'
alias killPlay='(lsof -n -i4TCP:9000 | grep LISTEN | awk "/LISTEN/ {print \$2}" | xargs kill -9) && sudo rm /Users/patrick/npl/RUNNING_PID'
alias st='sbt test'
alias gc='git c'

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='macos'
fi

node_command='nodejs'

if [[ $platform == 'linux' ]]; then
       node_command='nodejs'
elif [[ $platform == 'macos' ]]; then
  node_command='node'
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  export NVM_DIR="$HOME/.nvm"
  source "/usr/local/opt/nvm/nvm.sh"
  plugins+=( osx )
fi

SBT_OPTS="-Dsbt.jse.engineType=Node -Dsbt.jse.command="$(where $node_command | head -n 1)""

alias bash_profile='vim ~/.bash_profile;';

export PATH="/usr/local/sbin:$PATH"

#export ZPLUG_HOME=/usr/local/opt/zplug
#source $ZPLUG_HOME/init.zsh

eval "$(thefuck --alias)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/pmahoney/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/pmahoney/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/pmahoney/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/pmahoney/google-cloud-sdk/completion.zsh.inc'
fi

#`source /usr/local/share/antigen/antigen.zsh
source ~/antigen/antigen.zsh

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export HAXE_STD_PATH="/usr/local/lib/haxe/std"

export GROOVY_HOME=/usr/local/opt/groovy/libexec

fpath=(/usr/local/share/zsh-completions $fpath)

#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# OPAM configuration
. /Users/pmahoney/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

alias brewAll='for x in $(brew search); do brew install $x; done'

if [ -e /Users/pmahoney/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/pmahoney/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

alias gitignore='git config --local -e'

. /home/patrick/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
