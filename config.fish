set fish_greeting

set -l add_to_path $HOME/opt/cross/bin $HOME/.local/bin $HOME/bin /usr/local/go/bin /usr/local/cuda-9.0/bin
for entry in $add_to_path
    if test -d $entry
    and not contains $entry $PATH
        set -gx PATH $entry $PATH
    end
end

if test -d $HOME/.local/lib
    if test -n "$LD_LIBRARY_PATH"
        set -gx LD_LIBRARY_PATH "$HOME/.local/lib:$LD_LIBRARY_PATH"
    else
        set -gx LD_LIBRARY_PATH "$HOME/.local/lib"
    end
end

set -gx EDITOR vim
set -gx VISUAL vim

if test -d /cygdrive
    set -gx CYGWIN winsymlinks:native
end

if test -f $HOME/.pythonrc
    set -gx PYTHONSTARTUP $HOME/.pythonrc
end

alias ga="git add"
alias gau="git add -u"
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log"
alias glp="git log -p"
alias gs="git status"

function ls --description 'list directory contents'
    set -l param --color=auto
    if isatty stdout
        set param $param -h --indicator-style=classify
    end
    command ls $param $argv
end

if test -f $HOME/.ssh/config
    ssh-add -l > /dev/null ^&1
    if test $status -eq 2
        # prevent strange "global variable already exists" warning
        set -e SSH_AGENT_PID
        set -e SSH_AUTH_SOCK
        # any output breaks scp
        eval (ssh-agent -c | sed 's/^setenv/set -Ux/') > /dev/null
    end
end
