;; Set HDMI1 output as primary, turn off inbuilt screen (eDP1)
(shell-command "
xrandr --output HDMI1 --mode 1440x900 --primary --output eDP1 --off
")

;; Extended desktop: Arrange both screens side-by-side with proper scaling
(shell command "
xrandr --output HDMI1 --mode 1440x900 --pos 0x0
       --output eDP-1 --mode 1920x1080 --pos 1440x0
")

