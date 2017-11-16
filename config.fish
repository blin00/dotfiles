set add_to_path $HOME/opt/cross/bin $HOME/.local/bin
for entry in $add_to_path
    if test -d $entry
        set -x PATH $entry $PATH
    end
end

set -x EDITOR vim
set -x VISUAL vim
