if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    if command -v startxfce4 >/dev/null; then
        exec startxfce4
    elif command -v startx >/dev/null; then
        exec startx
    fi
fi
