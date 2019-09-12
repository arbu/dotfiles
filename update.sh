#! /bin/sh
set -e

dir() {
    mkdir -p "$HOME/.$1"
}

dot() {
    ln -sfn "$HOME/dotfiles/$1" "$HOME/.${2:-$1}"
}

dot profile
dot bashrc
dot zshrc
dot zprofile
dir ssh
dot ssh/config
dot gitconfig
dot nethackrc

dir config
dot htop config/htop
dot pdfpc config/pdfpc
dot compton.conf config/

dir vim/after
dir vim/undo
dir vim/autoload
dot vim/init.vim
dot vim/after/ftplugin
dot vim/after/syntax
dot vim/colors
dot vim/ftdetect
dot vim/syntax
dot vim/autoload/plug.vim

ln -sfn ".vim/init.vim" "$HOME/.vimrc"
ln -sfn "../.vim" "$HOME/.config/nvim"

dir local/bin
dot bin/fftmp local/bin/fftmp

if [ "`hostname`" = "bjork" ]; then
    dot herbstluft/xinitrc xinitrc
    dot herbstluft/Xresources Xresources
    dot herbstluft/sysinfo2 local/bin/sysinfo2
    dot herbstluft/herbstluftwm config/herbstluftwm
    dot herbstluft/sysinfo config/sysinfo
    dot herbstluft/termite config/termite
    dot herbstluft/user-dirs.dirs config/user-dirs.dirs
fi
