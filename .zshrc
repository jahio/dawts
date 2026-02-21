eval "$($HOME/opt/brew/bin/brew shellenv)"
export PATH="$HOME/opt/bin:$PATH"

# ASDF tool manager
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# aliases
alias gst='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias ls='eza -lamgh --icons --git --group-directories-first --color-scale-mode gradient --time-style="long-iso" -I ".DS_Store"'
alias df='duf'
alias less='moor'
alias cat='bat'
alias vim='nvim'
