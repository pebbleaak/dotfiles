# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------
# BASIC ENV
# -----------------------------------------
export EDITOR=vim
export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt AUTO_CD
bindkey -e

# Better colors for ls/grep/etc.
eval "$(dircolors -b)"

# -----------------------------------------
# OH-MY-ZSH CORE (robust/guarded)
# -----------------------------------------
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"

# Prefer p10k, but only if installed; otherwise use a simple theme.
if [[ -d "$ZSH_CUSTOM/themes/powerlevel10k" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME="robbyrussell"
fi

# Load Oh My Zsh if present; otherwise keep going gracefully.
if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  # Keep this list lean for speed; oh-my-zsh will load built-in plugin logic.
  plugins=(git fzf)
  source "$ZSH/oh-my-zsh.sh"
else
  echo "Oh My Zsh not found at $ZSH — continuing without it."
fi

# -----------------------------------------
# COMPLETION (native zsh)
# -----------------------------------------
autoload -Uz compinit
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-$ZSH_VERSION"
mkdir -p "${ZSH_COMPDUMP:h}"
compinit -d "$ZSH_COMPDUMP"

# Completion styles
zstyle ':completion:*' menu select=long
zstyle ':completion:*' matcher-list '' \
  'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' verbose true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# -----------------------------------------
# FZF (key bindings + completion)
# -----------------------------------------
[[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[[ -f /usr/share/doc/fzf/examples/completion.zsh    ]] && source /usr/share/doc/fzf/examples/completion.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# -----------------------------------------
# ZOXIDE (smart cd)
# -----------------------------------------
eval "$(zoxide init zsh)"

# -----------------------------------------
# QUALITY OF LIFE ALIASES
# -----------------------------------------
alias cat='batcat'
alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first'
alias la='eza -la --icons --group-directories-first'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'

# Jump quickly to Windows drives
alias cdrv='cd /mnt/c'
alias ddrv='cd /mnt/d'
alias hdrv='cd /mnt/h'

# Git quickies
alias gs='git status -sb'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'

# -----------------------------------------
# AUTOSUGGESTIONS & SYNTAX HIGHLIGHTING
# -----------------------------------------
[[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# -----------------------------------------
# POWERLEVEL10K
# -----------------------------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# -----------------------------------------
# WSL-SPECIFIC NICE-TO-HAVES
# -----------------------------------------
setopt NO_CASE_GLOB

# -----------------------------------------
# PROMPT FALLBACK (if no p10k + no OMZ theme)
# -----------------------------------------
if [[ -z "$POWERLEVEL9K_LEFT_PROMPT_ELEMENTS$POWERLEVEL10K_LEFT_PROMPT_ELEMENTS" && -z "$ZSH_THEME" ]]; then
  autoload -Uz promptinit && promptinit
  prompt adam1
fi



alias c:='cd /mnt/c'
alias d:='cd /mnt/d'
alias e:='cd /mnt/e'
alias f:='cd /mnt/f'
alias g:='cd /mnt/g'
alias h:='cd /mnt/h'

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"


alias gui='nautilus &>/dev/null &'
alias brave='brave-browser &>/dev/null &'
alias actp="source .venv/bin/activate"


# >>> NVM Setup >>>
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Always use Node 20 on shell startup
if command -v nvm >/dev/null 2>&1; then
  nvm use 20 >/dev/null
fi

# Ensure npm global binaries for the active Node are in PATH
export PATH="$(npm config get prefix)/bin:$PATH"

# Optional: show active Node version at login
echo "Using Node $(node -v)"
# <<< NVM Setup <<<

