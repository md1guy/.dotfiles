xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec i3
