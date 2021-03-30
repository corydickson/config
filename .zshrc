HISTFILE=~/.cache/.histfile
HISTSIZE=1000
SAVEHIST=1000
export LC_ALL=en_US.UTF-8

# environment variables
export EDITOR=vim
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true

setopt extendedglob
unsetopt beep

zstyle :compinstall filename '/home/cory/.zshrc'

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

autoload -Uz promptinit
promptinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

bindkey -M vicmd v edit-command-line
# vim mode
bindkey -v
export KEYTIMEOUT=1
# vim keys for menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Edit line vim:
autoload edit-command-line; zle -N edit-command-line
bindkey '^R' history-incremental-search-backward

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

# aliases
alias exrc='vim ~/.xinitrc'
alias i3conf='vim ~/.config/i3/config'
alias kittyconf='vim ~/.config/kitty/kitty.conf'
alias ls='ls --color=auto'
alias zshconf="vim ~/.zshrc"
alias grm="git rebase master"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"
alias gcm="git commit -m"
alias gpo="git push origin"
alias gplo="git pull origin"
alias gs="git stash"
alias gsa="git stash apply"
alias vi="vim"
alias dps="docker ps"
alias dk="docker kill"
alias dpsa="docker ps -a"

zle_highlight=('paste:none')
PROMPT='┌[%F{cyan}%n%f@%F{yellow}%m%f %F{magenta}%~%f%}]
└(%T) λ '
RPROMPT='$(__git_ps1 " %s ")'
# PS1='[\u@\h \W]\$ 'ZE=1000

export FZF_DEFAULT_OPTS='
	--color fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108
	--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source ~/scripts/git-prompt.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
