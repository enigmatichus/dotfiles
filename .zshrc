# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias yaya="yaourt -Syyua"
alias vboxmodprobe="sudo modprobe vboxdrv && sudo modprobe vboxnetflt"
alias vboxrmmod="sudo rmmod vboxnetflt && sudo rmmod vboxdrv"
alias minemine="java -jar -Xms1024M -Xmx1024M -Xincgc ~/Programmi/Minecraft_official/minecraft.jar"
alias usbripigl="sudo rmmod xhci_hcd && sudo modprobe xhci_hcd"
alias mineserv="cd ~/Programmi/Minecraft/server && java -jar minecraft_server.jar"
alias ethripigl="sudo rmmod r8169 && sudo modprobe r8169"
alias sdripigl="sudo echo 1 > /sys/bus/pci/rescan"
alias aggiornapy="sh ~/.local/share/aggiornatorePython/aggiornatorePython.sh"
alias ipythonqt="ipython qtconsole --colors=linux"
alias emd="emacs --daemon"
alias emk="emacsclient -e '(kill-emacs)'"
alias emc="emacsclient -c &"
#alias zyp="sudo zypper"
alias tranit="translate {=it}"
#alias zypup="sudo zypper refresh && sudo zypper update"
#alias matlabsuse="xdg-su -c /usr/local/MATLAB/MATLAB_Production_Server/R2013a/bin/matlab"
alias aggiornadeb="sudo aptitude update && sudo aptitude upgrade"
alias saptitude="sudo aptitude"
alias saptget="sudo apt-get"
alias saptcache="sudo apt-cache"

# Workaround per acroread:i386 su jessie
alias acroread="LD_LIBRARY_PATH=/usr/lib/mesa-diverted/i386-linux-gnu/:$LD_LIBRARY_PATH acroread"

alias origin9="WINEPREFIX=/home/luca/.wine32 wine /home/luca/.wine32/drive_c/Program\ Files/OriginLab/Origin9/Origin9.exe"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git screen pip)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/java/bin:/home/luca/.gem/ruby/2.0.0/bin
export EDITOR="emacsclient --tty"

# FOR opensuse steam audio problem
export SDL_AUDIODRIVER=pulseaudio
autoload -U zcalc

zmodload zsh/complist
autoload -U compinit
compinit

### If you want zsh's completion to pick up new commands in $path automatically
#### comment out the next line and un-comment the following 5 lines
zstyle ':completion:::::' completer _complete _approximate
#_force_rehash() {
#  (( CURRENT == 1 )) && rehash
#  return 1	# Because we didn't really complete anything
#}
#zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
