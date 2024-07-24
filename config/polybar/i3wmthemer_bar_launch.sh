#!/bin/env sh

#pkill polybar

#sleep 1;
#
#polybar i3wmthemer_bar &

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar
#xrandr --output eDP-1 --mode 1920x1200 --output DP-2 --primary --left-of eDP-1
#xrandr --output eDP-1 --mode 1920x1200 --output DP-2 --primary --left-of eDP-1
#polybar i3wmthemer_bar_ext &
#polybar i3wmthemer_bar &
#polybar i3wmthemer_bar_ext &
#xrandr --output eDP-1 --mode 1920x1200
#polybar i3wmthemer_bar_ext &

# Run the command and count the lines
line_count=$(xrandr --listmonitors | tail -n +2 | awk '{print $NF}' | wc -l)

# Check if the line count is equal to two
if [ $line_count -eq 2 ]; then
  #external_monitor = $(xrandr --listmonitors | tail -n +3 | awk '{print $NF}')
  # Second monitor
  monitor1=$(polybar -m|tail -1|sed -e 's/:.*$//g')
  # eDP-1
  monitor2=$(polybar -m|head -1|sed -e 's/:.*$//g')

  xrandr --output $monitor2 --mode 1920x1200 --output $monitor1 --primary --left-of $monitor2

  MONITOR2=$monitor2 polybar i3wmthemer_bar_ext &
  MONITOR1=$monitor1 polybar i3wmthemer_bar &
else
  xrandr --output eDP-1 --mode 1920x1200
  monitor1=$(polybar -m|head -1|sed -e 's/:.*$//g')
  MONITOR1=$monitor1 polybar i3wmthemer_bar &
fi
