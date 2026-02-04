export TERM="xterm-256color"

# Brew auto completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load
zle_highlight=('paste:none')

### Alias ###
alias ls="eza -lhF"
alias cat="bat"
alias ld="lazydocker"
alias lg="lazygit"
alias ghr="gh run watch"
alias e="emacsclient -c -n -a emacs $1"
#alias org="emacsclient -c -n -a emacs $HOME/org"
alias org="nvim $HOME/org"
alias n="nvim $1"
alias z="zellij -l welcome"
# IP addresses
alias ip="curl --silent https://myipv4.p1.opendns.com/get_my_ip | jq -r '.ip|tostring'"
alias ip4="curl --silent https://myipv4.p1.opendns.com/get_my_ip | jq -r '.ip|tostring'"
alias ip6="curl --silent https://myipv6.p1.opendns.com/get_my_ip | jq -r '.ip|tostring'"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Gatekeeper
alias gatekeeper-disable='sudo spctl --master-disable'
alias gatekeeper-enable='sudo spctl --master-enable'

### Custom Functions ###
# Youtube MP3 DL
function yt-mp3() {
  yt-dlp -x --audio-quality 0 $1
}

function fnm-latest() {
  fnm install $1
  PACKAGES=$(fnm exec --using=$2 npm list -g --depth=0 2>/dev/null | ...)
  fnm exec --using=$1 npm install -g $PACKAGES
  fnm exec --using=$1 corepack enable
}

# Init shell
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
eval "$(mise activate zsh)"
eval "$(pyenv init -)"
eval "$(starship init zsh)"

# Created by `pipx` on 2025-06-23 11:21:56
export PATH="$PATH:/Users/alex/.local/bin"
