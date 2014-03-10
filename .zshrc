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
	export PATH=$HOME/bin:/usr/local/bin:$PATH
	#export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin
elif [ `uname -s` = "Darwin" ]; then
	export PATH=$HOME/bin:/usr/local/bin:$HOME/bin/depot_tools:$PATH
    LD_LIBRARY_PATH=/usr/local/lib:/usr/sfw/lib:/opt/sfw/lib
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
fi

echo "`uname -s` configuration loaded."

# function
find-grep  () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

# color views
autoload -U colors ; colors

# command complete
fpath=(~/.zsh/completion $fpath)
autoload -U compinit ; compinit 
compinit -u
zstyle ':completion:*' menu select=1
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
zstyle ':completion:*:manuals' separate-sections true
#zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*' group-name ''
# sudores
zstyle ':completion:*:sudo:*' menu select=1
#zstyle ':completion:*:sudo:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:sudo:*' matcher-list 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
#zstyle ':completion:*:sudo:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:sudo:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:sudo:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:sudo:cd:*' ignore-parents parent pwd
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:sudo:*:*files' ignored-patterns '*?.o' '*?~' '*\#'


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
setopt brace_ccl
setopt extended_glob
setopt globdots

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

if [ `uname -s` = "Darwin" ] && [ -d /usr/local/opt/mysql ]; then
	alias mysql='/usr/local/opt/mysql/bin/mysql'
	alias mysqladmin='/usr/local/opt/mysql/bin/mysqladmin'
	alias mysqlimport='/usr/local/opt/mysql/bin/mysqlimport'
	alias mysql_config='/usr/local/opt/mysql/bin/mysql_config'
	alias mysqlbinlog='/usr/local/opt/mysql/bin/mysqlbinlog'
	alias mysqldump='/usr/local/opt/mysql/bin/mysqldump'
	alias mysqlhotcopy='/usr/local/opt/mysql/bin/mysqlhotcopy'
	alias mysqlmanager='/usr/local/opt/mysql/bin/mysqlmanager'
	alias mysqlcheck='/usr/local/opt/mysql/bin/mysqlcheck'
	
	if [[ "$TMUX" != "" ]]; then
		alias pbcopy="ssh 127.0.0.1 pbcopy"
		alias launchctl="ssh 127.0.0.1 launchctl"
	fi
elif [ -d /usr/local/mysql ]; then
	alias mysql='/usr/local/mysql/bin/mysql'
	alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
	alias mysqlimport='/usr/local/mysql/bin/mysqlimport'
	alias mysql_config='/usr/local/mysql/bin/mysql_config'
	alias mysqlbinlog='/usr/local/mysql/bin/mysqlbinlog'
	alias mysqldump='/usr/local/mysql/bin/mysqldump'
	alias mysqlhotcopy='/usr/local/mysql/bin/mysqlhotcopy'
	alias mysqlmanager='/usr/local/mysql/bin/mysqlmanager'
	alias mysqlcheck='/usr/local/mysql/bin/mysqlcheck'
fi

function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -dc $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
if [ `uname` = "Darwin" ]; then
  alias google-chrome='open -a Google\ Chrome'
fi
alias chrome='google-chrome'
alias -s html=chrome
function runcpp () { g++ -O2 $1; ./a.out }
alias -s {c,cpp}=runcpp
alias -s pl=perl
alias -s py=python
alias -s rb=ruby
alias -s php=php


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


# git flow completion
if [ -d ~/.zsh/git-flow-completion ]; then
	source ~/.zsh/git-flow-completion/git-flow-completion.zsh
	# cheat-sheet
	cheat-sheet () { zle -M "`cat ~/zsh/cheat-sheet.conf`" }
	zle -N cheat-sheet
	bindkey "^[^h" cheat-sheet
	
	git-cheat () { zle -M "`cat ~/zsh/git-cheat.conf`" }
	zle -N git-cheat
	bindkey "^[^g" git-cheat
fi


# like a bash
if [ "x$SHLVL" != "x1" ] && [ -d /etc/profile.d ]; then # We're not a login shell
    for i in /etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            . $i
        fi
    done
    unset i
fi

# Support for rbenv
if [[ -e $HOME/.rbenv/bin ]] && [[ -s $HOME/.rbenv/bin ]]; then
	export PATH=$HOME/.rbenv/bin:$PATH
	
	eval "$(rbenv init -)"
fi

if [ `uname` = "Darwin" ]; then
	export PATH="$(brew --prefix php55)/bin:$PATH"
fi


## Support for phpenv
#if [[ -e $HOME/.phpenv/bin ]] && [[ -s $HOME/.phpenv/bin ]]; then
#	export PATH=$HOME/.phpenv/bin:$PATH
#	eval "$(phpenv init -)"
#fi

# Support for nvm
if [ -d $HOME/.nvm ]; then
	source $HOME/.nvm/nvm.sh
fi

### Added by the Heroku Toolbelt
if [[ -d /usr/local/heroku/bin ]]; then
	export PATH="/usr/local/heroku/bin:$PATH"
fi

### Dependency local profiles
if [ -f $HOME/.zshrc.local ]; then
	source $HOME/.zshrc.local
fi 


PATH=.:$PATH



