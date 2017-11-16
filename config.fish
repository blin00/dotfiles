set add_to_path $HOME/opt/cross/bin $HOME/.local/bin
for entry in $add_to_path
    if test -d $entry
        set -x PATH $entry $PATH
    end
end

set -x EDITOR vim
set -x VISUAL vim
set -x PYTHONSTARTUP $HOME/.pythonrc
set -x CYGWIN winsymlinks:native

set fish_greeting

function ls --description 'list directory contents'
    set -l param --color=auto
        if isatty 1
            set param $param -h --indicator-style=classify
        end
        command ls $param $argv
end

if begin; test -z (command pgrep ssh-agent); and test -f $HOME/.ssh/config; end
    eval (command ssh-agent -c | sed 's/^setenv/set -Ux/')
end
