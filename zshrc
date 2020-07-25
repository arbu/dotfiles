autoload -U is-at-least
if is-at-least 5.0; then
    export ZSH="$HOME/dotfiles/oh-my-zsh"
    ZSH_THEME=""
    DISABLE_AUTO_UPDATE="true"
    source "$ZSH/oh-my-zsh.sh"

    fpath=( "$HOME/dotfiles/zsh-functions" $fpath )
    autoload -U promptinit
    promptinit
    if [[ "$USER" == "root" ]]; then
        PURE_PROMPT_SYMBOL="#"
    else
        PURE_PROMPT_SYMBOL="%%"
    fi
    zstyle :prompt:pure:git:stash show yes
    prompt pure

    source "$HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
    source "$HOME/dotfiles/zshrc-min"
fi

source "$HOME/.profile"
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back.
set -o emacs

if [[ -r /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi
