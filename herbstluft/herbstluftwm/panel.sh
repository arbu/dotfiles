#! /bin/bash
herbstclient pad ${1:-0} 25

$HOME/.local/bin/sysinfo2 > >(dzen2 -xs 0) &
PID=$!

herbstclient -w '(quit_panel|reload)'

kill $PID
