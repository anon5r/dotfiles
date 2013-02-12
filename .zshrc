#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

if [ $LANG != "ja_JP.UTF-8" ] && [ $LANG != "en_US.UTF-8" ]; then
    export LANG_OLD=$LANG
    #export LANG=ja_JP.UTF-8
    export LANG=en_US.UTF-8
fi

# config for OS types
if [ `uname -s` = "Linux" ]; then
	export PATH=$PATH:/usr/local/bin
	#export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin
	export PATH=$PATH:~/bin
elif [ `uname -s` = "Darwin" ]; then
	export PATH=$PATH:/usr/local/bin:$HOME/bin:$HOME/bin/depot_tools
	# for MacPorts
	#export PATH=/opt/local/bin:/opt/local/sbin/:$PATH:~/bin
    LD_LIBRARY_PATH=/usr/local/lib:/usr/sfw/lib:/opt/sfw/lib
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
fi

echo "`uname -s` configuration loaded."

# function
find-grep  () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

# color views
autoload -U colors ; colors

# command complete
autoload -U compinit ; compinit
zstyle ':completion:*' menu select=1
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
#zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:sudo:*' menu select=1
#zstyle ':completion:*:sudo:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:sudo:*' matcher-list 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
#zstyle ':completion:*:sudo:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:sudo:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 指定秒以上かかった処理は詳細表示                                                                                                                                             
REPORTTIME=2

autoload -U colors ; colors

setopt complete_in_word
#setopt NOBGNICE
#setopt HUP
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt extended_history
setopt rm_star_wait
setopt correct
setopt no_flow_control
setopt magic_equal_subst
setopt mark_dirs
setopt print_eight_bit
setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_to_home
setopt pushd_silent
setopt auto_list
setopt auto_menu
setopt auto_resume
setopt auto_name_dirs
setopt combining_chars

#setopt no_beep

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0


## Prompt settings
case ${UID} in
	0)
		#PROMPT="%{${fg[green]}%}[%n@%m %(5~,%-2~/.../%2~,%~)]%# %{${reset_color}%}"
		PROMPT="%{${fg[cyan]}%}[%n@%m %(1~,%1~,%~)]%# %{${reset_color}%}"
		PROMPT2="%{${fg[cyan]}%}%_>%{${reset_color}%}"
		SPROMPT="%{${fg_bold[red]}%}correct?: %R -> %r [n,y,a,e]? %{${reset_color}%}"
		;;
	*)
		#PROMPT="%{${fg[green]}%}[%n@%m %(5~,%-2~/.../%2~,%~)]%# %{${reset_color}%}"
		PROMPT="%{${fg[green]}%}[%n@%m %(1~,%1~,%~)]%# %{${reset_color}%}"
		PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
		SPROMPT="%{${fg_bold[red]}%}correct?: %R -> %r [n,y,a,e]? %{${reset_color}%}"
		#RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%"
		;;
esac


## Key binds
bindkey -e
bindkey "^?"    backward-delete-char
bindkey "^H"    backward-delete-char
bindkey "^[[3~" delete-char
# Home, End key
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OH~" beginning-of-line
bindkey "^[OF~" end-of-line 
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
# Pageup, Pagedown
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward



# Aliases

autoload -Uz zmv
alias zmv='noglob zmv -W'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -L'
alias ren='noglob zmv -W'

alias view="vim -R -N --noplugin"
if [ `uname -s` = "Darwin" ]; then
	# ls colors ( like BSD )
	alias ls='ls -FG'
else
	# GNULS
	alias ls='ls -F --color=auto'
fi
alias ll='ls -lh'
alias la='ls -lha'
if [ `command -v colordiff` &>/dev/null ]; then
	alias diff='colordiff'
fi
alias py='python'
alias zf='/usr/local/lib/php/ZendFramework/bin/zf.sh'

alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
alias mysqlimport='/usr/local/mysql/bin/mysqlimport'
alias mysql_config='/usr/local/mysql/bin/mysql_config'
alias mysqlbinlog='/usr/local/mysql/bin/mysqlbinlog'
alias mysqldump='/usr/local/mysql/bin/mysqldump'
alias mysqlhotcopy='/usr/local/mysql/bin/mysqlhotcopy'
alias mysqlmanager='/usr/local/mysql/bin/mysqlmanager'
alias mysqlcheck='/usr/local/mysql/bin/mysqlcheck'


# vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%F{green}[%f%F{red}%b%f%F{green}] (%s)%f'
zstyle ':vcs_info:*' actionformats '%f(%F{cyan}%s%f:%F{green}%b%f|%F{red}%a%f)'
zstyle ':vcs_info:svn:*' branchformat '%F{red}%b%f%F{green}:r%r%f'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '-'
zstyle ':vcs_info:git:*' formats '%F{green}[%f%F{red}%b%f%F{green}%c%F{red}%u%f%F{green}] (%s)%f'
zstyle ':vcs_info:git:*' actionformats '%f(%F{green}%b%f|%F{red}%a%f%F{green}%c%F{red}%u%f)'
precmd () {
	LANG=en_US.UTF-8 vcs_info
	RPROMPT=$vcs_info_msg_0_
}



# like a bash
if [ "x$SHLVL" != "x1" ]; then # We're not a login shell
    for i in /etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            . $i
        fi
    done
    unset i
fi

# Support for rbenv
if [[ -e $HOME/.rbenv/bin ]] && [[ -s $HOME/.rbenv/bin ]]; then
	export PATH=$PATH:$HOME/.rbenv/bin
	
	eval "$(rbenv init -)"
fi

