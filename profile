export PATH=$PATH:$HOME/.local/bin

if command -v nvim >/dev/null 2>&1; then
    export VISUAL=nvim
elif command -v vim >/dev/null 2>&1; then
    export VISUAL=vim
fi

set PAGER=less

if [[ "$TERM" = "xterm-termite" ]]; then
    alias ssh='TERM=xterm-color ssh'
elif [[ "$TERM" = "linux" ]]; then
    alias nvim='TERM=xterm-256color nvim'
fi

alias battery='echo "`cat /sys/class/power_supply/BAT0/capacity`% (`cat /sys/class/power_supply/BAT0/status | tr "[A-Z]" "[a-z]"`)"'
alias batcount='while true; do clear; cat /sys/class/power_supply/BAT0/capacity; sleep 60; done'

alias ls='ls --color=auto'
alias ll='ls -ahl'
alias ip='ip --color'
alias ipb='ip --color --brief'
alias mnt='sudo mount -o uid=`id -u`,gid=`id -g`'
alias btoff='sudo rfkill block bluetooth; sudo rfkill block wwan'
alias inet='sudo ifconfig enp0s25 up && sudo dhcpcd enp0s25'
alias vpn='sudo systemctl start openvpn-client@home'
alias novpn='sudo systemctl stop openvpn-client@home'
alias rename='perl-rename -v'
alias n='nvim'
alias mpa='mpv --no-video'
alias yaourt='echo -n "did you mean pakku?"; read; yaourt'
alias steamidle='ionice -c 3 -p $(pgrep ^steam\$)'
alias steamnice='ionice -c 2 -p $(pgrep ^steam\$)'
alias sc='sc-im'

mkcd() {
    mkdir -p "$1" && cd "$1"
}

c() {
  for ((i=0; i < ${1-1}; i++)); do
    cd ..
  done
}

sign-key() {
    gpg --recv-keys "$1" &&
    gpg --fingerprint "$1" &&
    gpg --sign-key "$1" &&
    gpg --send-keys "$1"
}

f() {
    grep -Rn --color=always "$@" | less -R
}

vga() {
    xrandr --output VGA1 --auto
    xrandr --output LVDS1 --off
    sleep 1
    herbstclient detect_monitors --no-disjoin
    herbstclient reload
}

lvds() {
    xrandr --output LVDS1 --auto
    xrandr --output VGA1 --off
    sleep 1
    herbstclient detect_monitors --no-disjoin
    herbstclient reload
}
