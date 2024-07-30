export TERM="xterm-256color"

# Antigen
source "/opt/homebrew/Cellar/antigen/2.2.3/share/antigen/antigen.zsh"
antigen init ~/.antigenrc

# Setup path
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"

### Alias ###
alias ls="eza -lhF"
alias cat="bat"
# IP addresses
alias ip="curl --silent https://myipv4.p1.opendns.com/get_my_ip | jq -r '.ip|tostring'"
alias ip6="curl --silent https://myipv6.p1.opendns.com/get_my_ip | jq -r '.ip|tostring'"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Gatekeeper
alias gatekeeper-disable='sudo spctl --master-disable'
alias gatekeeper-enable='sudo spctl --master-enable'

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

# Init shell
eval "$(fnm env)"
eval "$(pyenv init -)"
eval "$(starship init zsh)"

