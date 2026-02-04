eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"
# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Created by `pipx` on 2025-06-23 11:21:56
export PATH="$PATH:/Users/alex/.local/bin"

# Setup path
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.docker/bin:$PATH"
