export PATH="/usr/local/anaconda3/bin:$PATH"
export EDITOR=vim
set encoding=utf-8
DEFAULT_USER=techknowfile
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

alias tmux='tmux -2'
setopt shwordsplit


# ZGEN
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
    zgen loadall << EOPLUGINS 
        zsh-users/zsh-history-substring-search
EOPLUGINS

    # completions
    zgen load zsh-users/zsh-syntax-highlighting

    zgen load bhilburn/powerlevel9k powerlevel9k

    # save all to init script
    zgen save
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

export levels="ssh 01aabaed9@129.219.253.30 -p 1337"
# eval `dircolors '/home/techknowfile/.dir_colors/dircolors'`
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

export PATH="/home/techknowfile/anaconda3/bin:$PATH"
POWERLEVEL9K_PYTHON_ICON='\ue73c'
#POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_ANACONDA_BACKGROUND='149'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir rbenv vcs anaconda) 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=() 
# POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT"
# POWERLEVEL9K_VI_INSERT_MODE_BACKGROUND='green'
# POWERLEVEL9K_VI_COMMAND_MODE_STRING="NORMAL"
POWERLEVEL9K_ANACONDA_FOREGROUND='016'
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=''
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=''
# source ~/.shortcutsrc

# ROS/Gazebo
# source /opt/ros/indigo/setup.zsh
# source /opt/ros/indigo/setup.zsh
# source ~/catkin_ws/devel/setup.zsh
export PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python2.7/dist-packages"

if [ -n "$CONDA_DEFAULT_ENV" ]; then
    echo "source activate $CONDA_DEFAULT_ENV"
fi

# function zle-keymap-select zle-line-init
# {
#          change cursor shape in iTerm2
#              case $KEYMAP in
#                      vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
#                              viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
#                                  esac
        
#                                      zle reset-prompt
#                                          zle -R
        
# }

# function zle-line-finish
# {
#         print -n -- "\E]50;CursorShape=0\C-G"  # block cursor

# }

# zle -N zle-line-init
# zle -N zle-line-finish
# zle -N zle-keymap-select
# precmd() { RPROMPT=""  }
# function zle-line-init zle-keymap-select {
#    VIM_PROMPT="%F{red}[COMMAND]%  %{$reset_color%}"
#       RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#          zle reset-prompt

# }

# zle -N zle-line-init
# zle -N zle-keymap-select
# function zle-line-init {
#       powerlevel9k_prepare_prompts
#         if (( ${+terminfo[smkx]}  )); then
#                 printf '%s' ${terminfo[smkx]}
#                   fi
#                     zle reset-prompt
#                       zle -R

# }

# function zle-line-finish {
#       powerlevel9k_prepare_prompts
#         if (( ${+terminfo[rmkx]}  )); then
#                 printf '%s' ${terminfo[rmkx]}
#                   fi
#                     zle reset-prompt
#                       zle -R

# }

# function zle-keymap-select {
#       powerlevel9k_prepare_prompts
#         zle reset-prompt
#           zle -R

# }

# zle -N zle-line-init
# zle -N ale-line-finish
# zle -N zle-keymap-select

bindkey jk vi-cmd-mode 
bindkey kj vi-cmd-mode 
export KEYTIMEOUT=5
autoload -U colors
colors
export MALMO_XSD_PATH=/usr/local/malmo/Schemas
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
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
