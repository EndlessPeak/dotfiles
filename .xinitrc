xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

eval "$(exec dbus-launch --sh-syntax --exit-with-session)"
[ -f ~/.xprofile ] && source ~/.xprofile
exec dwm
