# -*- mode: shell-script; coding:utf-8 -*-

# .bashrc

# User specific aliases and functions

TERM=xterm

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -x `which zsh` ]; then
    exec zsh
fi
