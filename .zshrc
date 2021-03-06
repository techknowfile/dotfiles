LC_ALL="en_US.UTF-8"
# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
##########################
##  Shortcuts
##########################
 
alias cfi='vim ~/.i3/config'
alias cfz='vim ~/.zshrc'
alias p='cd ~/projects; ls -a'
alias D='cd ~/Downloads; ls -a'
alias d='cd ~/Documents; ls -a'
alias P='cd ~/Pictures; ls -a'
alias r='ranger'
alias t='cd ~/projects/thesis; ls -a'
alias www='cd ~/www/techknowfile.github.io; ls -a'


zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
alias ls="ls --color=auto -F"
export PATH="/usr/local/anaconda3/bin:/home/techknowfile/.vim/plugged/vim-live-latex-preview/bin:/home/techknowfile/spark/bin:$PATH"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
# export TERMCMD="x-terminal-emulator"
export EDITOR=vim
set encoding=utf-8
DEFAULT_USER=techknowfile
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

alias tmux='tmux' 
setopt shwordsplit


# ZGEN
if [ -e "${HOME}/.zgen/zgen.zsh" ] 
then
	source "${HOME}/.zgen/zgen.zsh"
	if ! zgen saved; then
		echo "Creating a zgen save"

		zgen oh-my-zsh
		
		# plugins
		zgen oh-my-zsh plugins/git
		zgen oh-my-zsh plugins/heroku
		zgen oh-my-zsh plugins/pip
		zgen oh-my-zsh plugins/lein
		zgen oh-my-zsh plugins/command-not-found
		
		# bulk load
		zgen loadall <<EOPLUGINS
			zsh-users/zsh-history-substring-search
EOPLUGINS

		# completions
		zgen load zsh-users/zsh-syntax-highlighting
		zgen load bhilburn/powerlevel9k powerlevel9k
		zgen load bckim92/zsh-autoswitch-conda
		zgen load changyuheng/zsh-interactive-cd

		# save all to init script
		zgen save
	fi
else
	git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

DISABLE_AUTO_TITLE="true"
# Load the oh-my-zsh's library
# antigen use oh-my-zsh

#  # Bundles from the default repo (robbyrussell's oh-my-zsh).
#  antigen bundle git
#  antigen bundle heroku
#  antigen bundle pip
#  antigen bundle lein
#  antigen bundle command-not-found

#  # Syntax highlighting bundle.
#  antigen bundle zsh-users/zsh-syntax-highlighting

#  # Load the theme.
#  antigen theme bhilburn/powerlevel9k powerlevel9k

#  # Tell Antigen that you're done.
#  antigen apply

# source ~/opt/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
export levels="ssh 01aabaed9@129.219.253.30 -p 1337"
eval `dircolors ''${HOME}/'.dir_colors/dircolors'`
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

export PATH="/home/techknowfile/anaconda3/bin:$PATH"
POWERLEVEL9K_PYTHON_ICON='\ue73c'
#POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_ANACONDA_BACKGROUND='149'
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir rbenv vcs anaconda) 
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir rbenv vcs anaconda) 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode) 
POWERLEVEL9K_VI_INSERT_MODE_STRING=""
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='blue'
POWERLEVEL9K_VI_COMMAND_MODE_STRING="<<<"
POWERLEVEL9K_ANACONDA_FOREGROUND='016'
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=''
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=''
source ~/.shortcutsrc

# ROS/Gazebo
# source /opt/ros/indigo/setup.zsh
# source /opt/ros/indigo/setup.zsh
# source ~/catkin_ws/devel/setup.zsh

if [ -n "$CONDA_DEFAULT_ENV" ]; then
    echo "source activate $CONDA_DEFAULT_ENV"
fi

# precmd() { RPROMPT="" }
# function zle-line-init zle-keymap-select {
#    # VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
# 	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=("%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}") 
#    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#    zle reset-prompt
# }

zle -N zle-line-init
zle -N zle-keymap-select

bindkey jk vi-cmd-mode 
bindkey kj vi-cmd-mode 
export KEYTIMEOUT=5
autoload -U colors
colors
export MALMO_XSD_PATH=/usr/local/malmo/Schemas
alias minecraft='/usr/local/malmo/Minecraft/launchClient.sh'
alias missions='cd ~/projects/malmo/missions'
## Fix keybindings
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal]]]]]]'
export XDG_CURRENT_DESKTOP=GNOME

unset PYTHONPATH
export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
stty -ixon

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fzf-cd {
	cd $(dirname $(fzf))
	zle reset-prompt
	zle -R
}
zle -N fzf-cd
bindkey ^f fzf-cd

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# cdg - cd into the root of current git directory
cdg() {
	cd $(git rev-parse --show-toplevel)
}

# tty console colors
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi

# fix ruby error for LustyJuggler
export RUBYOPT="-W0"
