# gnome keyring
if command -v gnome-keyring-daemon >/dev/null; then
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi

# x server
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    if command -v startxfce4 >/dev/null; then
        exec startxfce4
    elif command -v startx >/dev/null; then
        exec startx
    fi
fi
