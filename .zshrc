export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

autoload -U compinit
compinit 
export LANG=ja_JP.UTF-8 
export LSCOLORS=exfxcxdxbxegedabagacad

#alias rm="rmtrash"
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -l"
alias top="top -orsize"


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 

bindkey -v
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

setopt auto_cd 
setopt auto_pushd 
setopt correct 
setopt list_packed 
setopt nolistbeep 

autoload colors
colors
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[magenta]}%}%n %j%%%{${reset_color}%} "
  RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[magenta]}%}%n@${HOST%%.*} %j%%%{${reset_color}%} "
  ;;
esac

