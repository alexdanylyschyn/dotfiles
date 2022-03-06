# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$HOME/.node/bin:$PATH

export TERM="xterm-256color"

# Path to oh-my-zsh installation.
export ZSH=/Users/alex/.oh-my-zsh

# Plugin Config
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
export NVM_COMPLETION=true
plugins=(ssh-agent  wd)


# SSH
# export SSH_KEY_PATH="~/.ssh/id_rsa"
# zstyle :omz:plugins:ssh-agent identities id_rsa

source $ZSH/oh-my-zsh.sh

# Setup path
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

### Alias ###
alias ls="exa -lhGF"
alias cat="bat"
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Git Log
alias gll='git log --graph --pretty=oneline --abbrev-commit'


### Custom Functions ###
# Youtube MP3 DL
function yt-mp3() {
  youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg $1
}

function fnm-latest() {
  fnm install $1
  PACKAGES=$(fnm exec --using=$2 npm list -g --depth=0 2>/dev/null | ...)
  fnm exec --using=$1 npm install -g $PACKAGES
  fnm exec --using=$1 corepack enable
}

source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Init shell
eval "$(fnm env)"
eval "$(starship init zsh)"
