# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Antigen - Install and Configure Plugins and Themes

source $HOME/.config/zsh/antigen.zsh

# Load the oh-my-zsh library

antigen use oh-my-zsh

# Configure Plugins
zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent lifetime 8h
zstyle :omz:plugins:ssh-agent quiet yes

# Load bundles and plugins

antigen bundle git
antigen bundle ssh-agent
antigen bundle command-not-found
antigen bundle colored-man-pages

antigen theme romkatv/powerlevel10k

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions

# zsh-users/zsh-syntax-highlighting should be the last plugin loaded according to its documentation
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
# Antigen - End of Configuration


# Configure ZSH Options
autoload -U colors && colors

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# VI Mode Setup
bindkey -v
export KEYTIMEOUT=1

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# User Configuration
export EDITOR="vim"

# Append User Scripts and Binaries to the PATH
if [ -e $HOME/bin ]
  then path+=$HOME/bin
fi

if [ -e $HOME/.local/bin ]
  then path+=$HOME/.local/bin
fi

# Set up Doom Emacs if it is installed
if [ -e $HOME/.doom.d ]
  then
    path+=$HOME/.emacs.d/bin
    alias em="emacs -nw"
fi

# Nix Package Manager Configuration
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]
  then . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi

# Create an alias for the Windows Clipboard if Running on WSL
if [ -e /mnt/c/Windows/system32/clip.exe ]
  then
    alias clip="/mnt/c/Windows/system32/clip.exe"
fi

# X11 configuration for WSL2
if [ $(uname -r | grep -i microsoft) ]
  then
    export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0
    export LIBGL_ALWAYS_INDIRECT=0
fi

# Unlock Function
function unlock(){
  ssh-add -l > /dev/null
  if [ $? = 0 ]
    then
      echo "SSH is unlocked."
    else
      ssh-add
    fi
}

# Initialize homebrew if installed.
if [ -e /opt/homebrew/bin/brew ]
  then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
