# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export EDITOR=emacs

alias l='ls -laF'
alias k='ls -laF'
alias xs=cd
alias vf=cd
alias reset='$HOME/bin/xterm-title; \reset'
alias telent=telnet
alias m='python manage.py'

alias set_tmp_path='PATH=$HOME/tmp/usr/bin:${PATH}; echo $PATH'

# echo "=== SHLVL=$SHLVL"
# echo "=== PS1=$PS1"
# echo "=== PATH=$PATH"

test "$SHLVL" = "1" && {

	[ -x $HOME/bin ] && {
	    PATH=$HOME/bin:${PATH}
	}

	[ -x /usr/local/bin ] && {
	    PATH=/usr/local/bin:${PATH}
	}

	[ -x /opt/local/bin ] && {
	    PATH=/opt/local/bin:${PATH}
	}

	# [ -x $HOME/tmp/usr/bin ] && {
	#     PATH=$HOME/tmp/usr/bin:${PATH}
	# }

	# [ -x /usr/local/git/bin ] && {
	#     PATH=/usr/local/git/bin:${PATH}
	# }

	[ -x /Developer/usr/bin/ ] && {
	    PATH=/Developer/usr/bin/:${PATH}
	}

	[ -x /Users/vadim/Desktop/Postgres.app/Contents/MacOS/bin/ ] && {
	    PATH=/Users/vadim/Desktop/Postgres.app/Contents/MacOS/bin/:${PATH}
	}

	USER_SITE=$(python -m site --user-site | sed 's!lib/python/site-packages!bin!')
	PATH=${USER_SITE}:$PATH
}

TTY=`tty | egrep '/dev/pts|/dev/ttyp|/dev/ttys'`
[ -n "$TTY" ] && SET_XTERM_TITLE=yes;
STTY="stty"

[ "${SET_XTERM_TITLE}" = "yes" ] && {

    $STTY -istrip
    $STTY erase '^H'
    $STTY intr '^C'
  
    HOST=`uname -n| sed 's/\..*$//'`

    [ "$TERM" = "screen" ] && {
        printf "\033k$HOST\033\\"
    } || {
        printf "\033]0;$HOST\007"
    }
}
 
#PS1="\u@\h .../\W\$"
#export PS1='\n[\u@\h \! \w]\n\[\e[32m\]\$ \[\e[0m\]'
export PS1="\w 🍔  > "

export CVS_RSH=ssh

ulimit -c unlimited

shopt -s cdspell

export XAPPLRESDIR=/home/vadim/.X/app-defaults/
export HISTIGNORE="&:[bf]g:exit"

test -z "$DISPLAY" && export DISPLAY=":0.0"

# create .inputrc to support ctrl-left and ctrl-right in Mac OS X Terminal
#
system=$(uname -s)
test $system = "Darwin" && {
    INPUTRC="$HOME/.inputrc"
    test -f $INPUTRC || {
    cat > $INPUTRC << EOF
# For Apple Terminal and Ctrl-Left, Ctrl-Right:
"\e[5D": backward-word
"\e[5C": forward-word
#
# For iTerm: 
# Ctrl-Left, Ctrl-Right:
"\e[1;5D": backward-word
"\e[1;5C": forward-word
# Option-Left, Option-Right:
"\e\e[D": backward-word
"\e\e[C": forward-word
EOF
        bind -f $INPUTRC
    }
}

########## Completion in ssh 

complete -r ssh
_cssh ()
{
cur=${COMP_WORDS[COMP_CWORD]};
COMPREPLY=($(compgen -W "$(cat ${HOME}/.ssh/known_hosts ${HOME}/.ssh/known_vms |awk -F ',' '{print $1}')" -- ${cur##root@}))
}
# complete -P "vadim@" -F _cssh ssh
complete -F _cssh ssh

########## Ruby stuff

test "$SHLVL" = "1" && {
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
	export PATH="$HOME/.gem/ruby/1.9.1/bin:$PATH"
}

