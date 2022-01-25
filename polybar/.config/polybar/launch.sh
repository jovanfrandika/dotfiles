# Terminate already running bar instances and tray
killall -q polybar
killall -q nm-applet
killall -q blueman-applet

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar -c ${HOME}/.config/polybar/config.ini main &
polybar -c ${HOME}/.config/polybar/config.ini main2 &

# Launch applets
nm-applet &
blueman-applet &


