ZSHRC="${(%):-%N}"
DOTFILES="${ZSHRC:A:h}"
autoload -U is-at-least
if is-at-least 5.0; then
    export ZSH="$DOTFILES/oh-my-zsh"
    ZSH_THEME=""
    DISABLE_AUTO_UPDATE="true"
    source "$ZSH/oh-my-zsh.sh"

    fpath=( "$DOTFILES/zsh-functions" $fpath )
    autoload -U promptinit
    promptinit
    if [[ "$USER" == "root" ]]; then
        PURE_PROMPT_SYMBOL="#"
    else
        PURE_PROMPT_SYMBOL="%%"
    fi
    zstyle :prompt:pure:git:stash show yes
    prompt pure

    if [[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
        source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi

    if [[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi

    if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
        source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    if [[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
        source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    (( ${+aliases[run-help]} )) && unalias run-help
    autoload -Uz run-help
else
    source "$DOTFILES/zshrc-min"
fi

source "$HOME/.profile"
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back.
set -o emacs

if [[ -r /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi
