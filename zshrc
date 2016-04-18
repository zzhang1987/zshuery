


source $HOME/.config/zshuery/main.rc.zsh
source $HOME/.config/zshuery/tools.rc.zsh

source $HOME/.config/zshuery/python.rc.zsh
source $HOME/.config/zshuery/latex.rc.zsh


PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;


# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source $HOME/.config/zshuery/liquidprompt/liquidprompt
LP_MARK_GIT="❀"



zle_highlight=(region:standout special:standout suffix:bold isearch:underline)

load_defaults
load_aliases
load_completion  ~/.config/zshuery/completion/src
load_correction


setopt extended_glob


if is_mac; then
    export EDITOR='mvim'

    [[ -d ~/Dropbox/bin ]] && export PATH=~/Dropbox/bin:$PATH
    [[ -d ~/bin ]] && export PATH=~/bin:$PATH
    [[ -d /usr/local/cuda/bin ]] && export PATH=/usr/local/cuda/bin:$PATH
    [[ -d ~/opt ]] && export PATH=~/opt:$PATH

    [[ -d ~/.local/bin ]] && export PATH=~/.local/bin:$PATH
    #[[ -d ~/anaconda/bin ]]      && export PATH=~/anaconda/bin:$PATH
    #[[ -d /usr/local/cuda/lib ]] && export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

else
    export EDITOR='vim'
fi

[[ -d $HOME/perl5/lib/perl5 ]] && export PERL5LIB=$HOME/perl5/lib/perl5


virtual_envs=($HOME/python $HOME/Projects/python)
export PIP_DOWNLOAD_CACHE=$HOME/.pip_cache



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


