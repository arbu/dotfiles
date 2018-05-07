autoload -U is-at-least
if is-at-least 5.0; then
    export ZSH=$HOME/dotfiles/oh-my-zsh
    ZSH_THEME="flazz"
    plugins=(git comand-not-found)
    source $ZSH/oh-my-zsh.sh
else
    source $HOME/dotfiles/zshrc-min
fi

source ~/.profile
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back.
set -o emacs

source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [[ -r /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi
