# Path to your Oh My Zsh installation.
export ZSH="$HOME/.config/ohmyzsh"

ZSH_THEME="owntheme"  # set to random to iterate among list below
# owntheme from '3den' theme at
# .oh-my-zsh/custom/themes/owntheme.zsh-theme:
# PROMPT=$'%{$fg[white]%}$(ruby_prompt_info) %{$fg_bold[cyan]%}%~%{$reset_color%}$(git_prompt_info) %{$fg[cyan]%}%D{[%Y-%m-%d %H:%M:%S]}\
# %{$reset_color%} '
# ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}("
# ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="*"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_RANDOM_CANDIDATES=( 
#  "essembeh"  # simple one-liner
#  "macovsky"  # simple one-liner
#  "candy"  # 2-line, time
  "3den"
#  "bira"  # 2-line, no time
)

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# vi-mode settings
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=false
INSERT_MODE_INDICATOR=" 󰫶 "
MODE_INDICATOR=" 󰫻 "
# timer settings
TIMER_PRECISION=1
TIMER_FORMAT='\n[%d]'
TIMER_THRESHOLD=0.5

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=( git vi-mode timer pixi-env )

source $ZSH/oh-my-zsh.sh

PROMPT="$PROMPT\$(vi_mode_prompt_info) "
RPROMPT="$RPROMPT"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
LS_COLORS='ln=1;4:ex=0;4:ow=0:mi=0:so=0'
export LS_COLORS
# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu

alias l='ls -hal --group-directories-first --color'
alias ls='ls --color=auto'
# show permission codes with ls
alias cls="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
alias job='ps -ef | grep frivas1'
alias tail='tail -n 20'
alias grep='grep --color=auto'
# arch update mirror list
alias update_mirrors='sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist'
alias v='nvim'
alias vi='nvim'

alias runwebui="sudo systemctl start docker && sudo docker start -i -a open-webui"

export OLLAMA_MODELS=/home/fdo/.ollama/models
export OLLAMA_HOST=127.0.0.1:8090
export PATH="$PATH:/home/fdo/.pixi/bin"

# hook to kickstart pixi shells with macchina
# macchina seems to clog the startup process
function pixi_hook(){
  eval "$(pixi shell-hook)"
}

function pixi_trim_ps1(){
  pixi config set shell.change-ps1 false
}

function fastfetch_switch_waifu(){
	source ~/.config/fastfetch/change_waifu.sh
}

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
