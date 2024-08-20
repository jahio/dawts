eval "$($HOME/opt/brew/bin/brew shellenv)"
export PATH="$HOME/opt/bin:$PATH"

# For pyenv:
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# for rbenv
eval "$(rbenv init - zsh)"

# aliases
alias gst='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias ls='eza -lamgh --icons --git --group-directories-first --color-scale-mode gradient --time-style="long-iso" -I ".DS_Store"'
alias df='duf'
alias less='moar'
alias cat='bat'
alias vim='nvim'
