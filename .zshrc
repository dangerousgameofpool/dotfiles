# Created by newuser for 5.8.1

PROMPT="[%n@%m %~]$ "

alias c="clear"
alias v="nvim"

# Changing "ls" to "eza"
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

# GO
alias gr="go run"
alias gmi="go mod init"
alias gog="go get"

if [ -d "/usr/local/go/bin" ] ;
	then PATH="$PATH:/usr/local/go/bin"
fi

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
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
