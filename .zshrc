autoload -U compinit
compinit
export LANG=ja_JP.UTF-8
export LSCOLORS=exfxcxdxbxegedabagacad
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

watch="all"
log

#alias rm="rmtrash"
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -l"
alias top="top -orsize"
#alias rm="rmtrash"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

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

#
# Show branch name in Zsh's right prompt
#

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

setopt prompt_subst
setopt re_match_pcre

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

        st=`git status 2> /dev/null`
				if [[ "$st" =~ "(?m)^nothing to" ]]; then
                color=%F{green}
				elif [[ "$st" =~ "(?m)^nothing added" ]]; then
                color=%F{yellow}
				elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
                color=%B%F{red}
        else
                 color=%F{red}
         fi

              
        echo "$color$name$action%f%b "
}


. `brew --prefix`/etc/profile.d/z.sh

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
#RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%} "
RPROMPT='[`rprompt-git-current-branch`%~]'
PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
PROMPT="%{${fg[magenta]}%}%n@${HOST%%.*} %j%%%{${reset_color}%} "
;;
esac

eval "$(rbenv init -)"
source ~/perl5/perlbrew/etc/bashrc

