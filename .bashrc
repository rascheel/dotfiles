# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias g='gvim --remote-silent'
alias shutdown='sudo shutdown now'
alias restart='sudo shutdown -r now'
alias gdb = 'gdb --tui'
