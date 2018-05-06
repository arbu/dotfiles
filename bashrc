source ~/.profile 

if shopt -q login_shell && command -v zsh; then
    export SHELL=$(command -v zsh)
    exec $SHELL -l
fi
