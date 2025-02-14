export ZSH="$HOME/.oh-my-zsh"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Use modern completion system
autoload -U compinit
compinit

# colors
autoload -U colors && colors

# Set up the prompt
autoload -U promptinit
promptinit
#prompt adam1
#export PROMPT='%n@%m:%~/> '
export PROMPT="%{$fg_bold[green]%}%n@%m%{$fg_no_bold[green]%}:%~/%{$fg[red]%}>> %{$reset_color%}"
export RPROMPT='%D %T'

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#Fish
if [[ $OSTYPE == *"darwin"* ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ $OSTYPE == *"linux"* ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
fi

## alias ##
# ls
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# zsh
alias zshcfg='vim ~/.zshrc'
alias zshsrc='source ~/.zshrc'

# vim
alias vimcfg='vim ~/.vimrc'

# disk
alias df='df -h'
alias du='du -ach -d 1 | sort -h'

#mba
if [[ $HOST == "MBA"* ]]; then
    alias sshbc='ssh -Y uu@bc'
fi

