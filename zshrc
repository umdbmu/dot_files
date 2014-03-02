autoload -U compinit
compinit
setopt prompt_subst
#setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
autoload predict-on
predict-on

# vcs_info
autoload vcs_info
# gitのみ有効にする
zstyle ":vcs_info:*" enable git
# commitしていない変更をチェックする
zstyle ":vcs_info:git:*" check-for-changes true
# gitリポジトリに対して、変更情報とリポジトリ情報を表示する
zstyle ":vcs_info:git:*" formats "%c%u[%b:%r]"
# gitリポジトリに対して、コンフリクトなどの情報を表示する
zstyle ":vcs_info:git:*" actionformats "%c%u<%a>[%b:%r]"
# addしていない変更があることを示す文字列
zstyle ":vcs_info:git:*" unstagedstr "<U>"
# commitしていないstageがあることを示す文字列
zstyle ":vcs_info:git:*" stagedstr "<S>"

# git：まだpushしていないcommitあるかチェックする
my_git_info_push () {
    if [ "$(git remote 2>/dev/null)" != "" ]; then
	local head="$(git rev-parse HEAD)"
	local remote
	for remote in $(git rev-parse --remotes) ; do
	    if [ "$head" = "$remote" ]; then return 0 ; fi
	done
	# pushしていないcommitがあることを示す文字列
	echo "<P>"
    fi
}

# git：stashに退避したものがあるかチェックする
my_git_info_stash () {
    if [ "$(git stash list 2>/dev/null)" != "" ]; then
	# stashがあることを示す文字列
	echo "{s}"
    fi
}

my_vcs_info() {
    vcs_info
    echo $(my_git_info_stash)$(my_git_info_push)$vcs_info_msg_0_
}

case ${UID} in
    0)
	PROMPT="%B%{[31m%}%/#%{m%}%b %f%1v%# "
	RPROMPT=$'$(my_vcs_info)'	
	PROMPT2="%B%{[31m%}%_#%{[m%}%b "
	SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
	PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
	;;
    *)
	PROMPT="%{[31m%}%/%%%{[m%} "
	RPROMPT=$'%{[37m%} $(my_vcs_info)'
	PROMPT2="%{[31m%}%_%%%{[m%} "
	SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
	PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
	;;
esac

# set terminal title including current directory
#
case "${TERM}" in
    kterm*|xterm)
	    precmd() {
	            echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
	        }
	        ;;
    esac

# zshの初回起動時にemacs daemon を立ち上げる
	if pgrep emacs >/dev/null 2>&1; then
	    echo "Emacs server is already running..."
	else
		case "${OSTYPE}" in
		    darwin*)
			/opt/local/bin/emacs --daemon
			;;
		linux*)
			/usr/bin/emacs --daemon
			;;
		esac
	fi

alias emacs="emacsclient -nw"
# lsに色をつける
case "${OSTYPE}" in
    darwin*)
	alias ls="ls -G"
	alias ll="ls -lG"
	alias la="ls -laG"
	;;
    linux*)
	alias ls='ls --color'
	alias ll='ls -l --color'
	alias la='ls -la --color'
	;;
esac

export EDITOR=emacs
