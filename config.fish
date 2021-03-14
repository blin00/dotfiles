set -l os (uname)

set fish_greeting

set fish_color_autosuggestion 555 brblack
set fish_color_cancel -r
set fish_color_command --bold
set fish_color_comment red
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end brmagenta
set fish_color_error brred
set fish_color_escape bryellow --bold
set fish_color_history_current --bold
set fish_color_host normal
set fish_color_match --background=brblue
set fish_color_normal normal
set fish_color_operator bryellow
set fish_color_param cyan
set fish_color_quote yellow
set fish_color_redirection brblue
set fish_color_search_match bryellow --background=brblack
set fish_color_selection white --bold --background=brblack
set fish_color_status red
set fish_color_user brgreen
set fish_color_valid_path --underline

function fish_right_prompt
    if set -q fish_private_mode
        set_color purple
        echo -n '[private]'
        set_color normal
    end
end

function fish_title
    echo $_ (prompt_pwd)
end

set -l prepend_to_path $HOME/opt/cross/bin $HOME/.cargo/bin $HOME/.local/bin $HOME/bin /usr/local/go/bin /usr/local/sbin /usr/local/cuda/bin $HOME/Library/Python/3.7/bin
set -l append_to_path $HOME/android/platform-tools

for entry in $prepend_to_path
    if test -d $entry; and not contains $entry $PATH
        set -gx PATH $entry $PATH
    end
end

for entry in $append_to_path
    if test -d $entry; and not contains $entry $PATH
        set -gx PATH $PATH $entry
    end
end

set -l nix_profile $HOME/.nix-profile/etc/profile.d/nix.sh
if test -e $nix_profile
    fenv source $nix_profile 2> /dev/null
end

if false; and test -d $HOME/.local/lib
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

alias build="g++ -std=gnu++17 -Wall -g -O2 -march=native -fsanitize=address,undefined -Wextra -Wshadow -DDEBUG_393939"

alias py2="python2"
alias py="python3"
alias py3="python3"

alias ga="git add"
alias gau="git add -u"
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log"
alias glo="git log --oneline"
alias glp="git log -p"
alias gs="git status"

alias pacman="pacman --color auto"

function yolossh
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $argv
end

if false; and test $os = 'Darwin'
    alias shred="gshred"
    alias base64="gbase64"

    alias md5sum="gmd5sum"
    alias sha1sum="gsha1sum"
    alias sha256sum="gsha256sum"

    function ls --description 'List contents of directory'
        set -l param -G
        if isatty stdout
            set param $param -h -F
        end
        command ls $param $argv
    end
else
    function ls --description 'List contents of directory'
        set -l param --color=auto
        if isatty stdout
            set param $param -h --indicator-style=classify
        end
        command ls $param $argv
    end
end

if test -f $HOME/.ssh/.agent
    ssh-add -l > /dev/null 2>&1
    if test $status -eq 2
        # prevent strange "global variable already exists" warning
        set -e SSH_AGENT_PID
        set -e SSH_AUTH_SOCK
        # any output breaks scp
        eval (ssh-agent -c | sed 's/^setenv/set -Ux/') > /dev/null
    end
end
