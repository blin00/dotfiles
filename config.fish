set fish_greeting

set -l add_to_path $HOME/opt/cross/bin $HOME/.local/bin /usr/local/go/bin
for entry in $add_to_path
    if test -d $entry
    and not contains $entry $PATH
        set PATH $entry $PATH
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


function ls --description 'list directory contents'
    set -l param --color=auto
        if isatty stdout
            set param $param -h --indicator-style=classify
        end
        command ls $param $argv
end

if test -z (pgrep ssh-agent)
and test -f $HOME/.ssh/config
    eval (ssh-agent -c | sed 's/^setenv/set -Ux/')
end
