# ~/.config/fish
#
# Configuration file for the fish shell.

# SSH Agent
#
# Start SSH agent if it hasn't already started.  Export the SSH_AUTH_SOCK
# and SSH_AGENT_PID environment variables across sessions.  Add the default
# SSH key to the SSH agent if it hasn't been done so already. Use "unlock" to
# add the ssh key to the agent.

if test -z (pgrep ssh-agent)
	eval (ssh-agent -c) > /dev/null
	set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
	set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

# Set DISPLAY if running on WSL2
if uname -r | grep -i microsoft &> /dev/null
    set -Ux DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
    set -Ux LIBGL_ALWAYS_INDIRECT 1
end

# Set variable for the OS Version
#
if test /etc/os-release
	set PRETTY_NAME (awk -F '"' '/PRETTY_NAME/ {print $2}' /etc/os-release)
end

# Add user specific directories to the PATH.
if test -e $HOME/bin
	set PATH $PATH $HOME/bin
end

if test -e $HOME/.local/bin
	set PATH $PATH $HOME/.local/bin
end

if test -e $HOME/.emacs.d/bin
	set PATH $PATH $HOME/.emacs.d/bin
end

# Set Aliases
#

## Directory Navigation

alias .. 'cd ..'
alias ... 'cd ../..'

## Map clip to the Windows Clipboard

if test -e /mnt/c/Windows/system32/clip.exe
	alias clip /mnt/c/Windows/system32/clip.exe
end

## Use Neovim as Vim if Neovim is installed

if test -e /usr/bin/nvim
    alias vim "nvim"
end

## Use exa in place of ls if exa is installed

if test -e /usr/bin/exa
    alias ls "exa"
end

