

source ~/Configfiles/zshuery/zshuery.sh
load_defaults
load_aliases
load_completion  ~/Configfiles/zshuery/completion/src
load_correction

prompts '%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'

if is_mac; then
    export EDITOR='mvim'

    [[ -d ~/Dropbox/bin ]] && export PATH=~/Dropbox/bin:$PATH

else
    export EDITOR='vim'
fi

chpwd() {
    update_terminal_cwd
}

# zsh has its own line editor (ZLE) and doesn't read readline's .inputrc

bindkey -v
#history only on first substring of command you're typing
#bindkey "\e[A" up-line-or-search
#bindkey "\e[B" down-line-or-search
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
#new iterm binds up arrow to this, wtf, ^[[A is standard on all other xterm's
bindkey "\eOA" history-beginning-search-backward
bindkey "\eOB" history-beginning-search-forward

bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\eOd" backward-word
bindkey "\eOc" forward-word 

