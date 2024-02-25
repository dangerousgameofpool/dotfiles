
PROMPT="[%n@%m %~]$ "

alias c="clear"
alias v="nvim"
alias nb="newsboat"

# Changing "ls" to "eza"
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

# let useful scripts I write or find run anywhere
export PATH=$PATH:~/scripts

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/layne/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/layne/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/layne/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/layne/anaconda3/bin:$PATH"
    fi
fi

# Golang
if [ -d "/usr/local/go/bin" ] ;
	then PATH="$PATH:/usr/local/go/bin"
fi

# Rust/Cargo
export PATH=$PATH:~/.cargo/bin/
unset __conda_setup
# <<< conda initialize <<<

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#WSL: open links in windows
export BROWSER=wslview

