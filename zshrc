source ~/Configfiles/zshuery/zshuery.sh
load_defaults
load_aliases
load_completion $yourdotfiles/zshuery/completion/src
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



