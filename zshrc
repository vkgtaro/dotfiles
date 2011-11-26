# -*- mode: shell-script; coding:utf-8 -*-

#-----------------------------------------------
# load dev env config
#-----------------------------------------------
# share screen session with users in .dev_users
# if we load this config

[ -e ~/.devenvrc ] && source ~/.devenvrc

#-----------------------------------------------
# load user config
#-----------------------------------------------
[ -e ~/.zshrc-before ] && source ~/.zshrc-before

#-----------------------------------------------
# Set shell options
#-----------------------------------------------

autoload -U compinit
compinit -u

setopt auto_menu auto_cd correct auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys
setopt promptcr print_eight_bit share_history

#-----------------------------------------------
# history
#-----------------------------------------------
HISTFILE="$HOME/.zhistory"
HISTSIZE=100000
SAVEHIST=100000
function history-all { history -E 1 }

#-----------------------------------------------
# emacs key bind
#-----------------------------------------------
bindkey -e

#-----------------------------------------------
# emacs key bind
#-----------------------------------------------

stty stop undef

#-----------------------------------------------
# ENV
#-----------------------------------------------
PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH:$HOME/bin
export EDITOR=vim
export AUTHOR="lazy people C<< <info __at__ lazy-people.org> >>"
export LC_ALL=C
export LANG="ja_JP.UTF-8"
export LC_COLORS='di=01;37;40;'
export PERL_AUTOINSTALL="--defaultdeps"

#-----------------------------------------------
# PROMPT
#-----------------------------------------------
HOSTNAME=`hostname`
PROMPT="[%{[01;32m%}${USER}@$HOSTNAME%{[m%}] %(!.#.$) "
RPROMPT="[%{[01;32m%}%~%{[m%}]"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#-----------------------------------------------
# alias
#-----------------------------------------------

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -vG"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias screen="screen -O -U"
alias cattest="CATALYST_DEBUG=0 prove --lib lib t"
alias cattestpod="CATALYST_DEBUG=0 TEST_POD=1 prove --lib lib t"
alias svndiff="svn diff | vless"
alias ducks='du -cks * |sort -rn |head -11'

#-----------------------------------------------
# ファイル検索
# http://d.hatena.ne.jp/hirose31/20090422/1240377735
#-----------------------------------------------
iname() {
  find . -type d -name .svn -prune -o \( -iname "*$1*" -print \)
}

#-----------------------------------------------
# screen の下のラインに打ったコマンドを表示
#-----------------------------------------------
if [ "$TERM" = "screen" ]; then
#    chpwd () { echo -n "_`dirs`\\" && ls -l }
    chpwd () { echo -n "_`dirs`\\" }
    preexec() {
        # see [zsh-workers:13180]
        # http://www.zsh.org/mla/workers/2000/msg03993.html
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        case $cmd[1] in
            fg)
    if (( $#cmd == 1 )); then
        cmd=(builtin jobs -l %+)
        else
        cmd=(builtin jobs -l $cmd[2])
        fi
    ;;
            %*) 
    cmd=(builtin jobs -l $cmd[1])
    ;;
            cd)
    if (( $#cmd == 2)); then
        cmd[1]=$cmd[2]
        fi
    ;&
    *)
    echo -n "k$cmd[1]:t\\"
    return
    ;;
    esac

    local -A jt; jt=(${(kv)jobtexts})

    $cmd >>(read num rest
        cmd=(${(z)${(e):-\$jt$num}})
        echo -n "k$cmd[1]:t\\") 2>/dev/null
    }
    chpwd
fi

#-----------------------------------------------
# load zsh scripts
#-----------------------------------------------
[ -e ~/.zsh.d ] && source ~/.zsh.d/*

#-----------------------------------------------
# load user config
#-----------------------------------------------
[ -e ~/.zshrc-after ] && source ~/.zshrc-after

