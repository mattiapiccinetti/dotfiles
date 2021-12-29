eval "$(direnv hook zsh)"
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# TheFuck
export THEFUCK_PRIORITY="git_hook_bypass=1100"
eval $(thefuck --alias)

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="/usr/local/bin/code"

alias z\!="exec zsh"
alias z\?="code $HOME/.dotfiles"
alias ls="lsd"
alias top="glances"
alias cat="bat -p"
alias tree="tree -a -I .git"
alias ls="${aliases[ls]:-ls} -A"
alias ll="ls -la"

# Google Cloud SDK
export PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Mix
source $HOME/.zsh-functions.sh
