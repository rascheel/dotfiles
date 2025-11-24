alias start_vnc_server='x0vncserver -display :1 -Geometry 3440x1440+0+633 -PasswordFile ~/.vnc/passwd -fg'
alias timelog='python3 ~/scripts/time_logger.py'
alias worklog='python3 ~/scripts/time_logger.py'

alias vim="nvim"
alias vi="nvim"

# For use with sudoedit
export EDITOR=nvim

# Get color when searching and piping to less
alias grep="rg --color=always"
alias rg="rg --heading --color=always"
alias less="less -R"
alias tree="tree -C"

# Common typos for me
alias qgit="git"

# Get the weather forecast in the terminal
alias weather="curl wttr.in"

# Make the shell cd to wherever I traveled to with ranger
#alias ranger=". ranger"
alias ranger='ranger --choosedir="$HOME/.rangerdir"; cd (cat $HOME/.rangerdir)'

# Make an alias I can pipe stuff to to get it into the clipboard
alias clipboard="xclip -sel clipboard"

# Make an alias to return to current directory. Useful in the yocto build directory when
# in a directroy that gets deleted.
alias cdp='cd (pwd)'

# Erase the fish greeting
set fish_greeting

# Set fzf key bindings
fzf_key_bindings

# Functions
function reboot-to-windows
    sudo grub-reboot 4
    sudo reboot
end

function logcat
    cat $argv[1] | ccze -A | less -R
end

function notify
    set NOTIFY_URL "ntfy.sh/scheel_notifications_6bEc3qGcsTNDoogv"
    set MESSAGE $argv[1]
    curl -d "$MESSAGE" $NOTIFY_URL
end
