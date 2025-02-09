#!/usr/bin/env fish

set threshold 20

while true
    set battery_percentage (cat /sys/class/power_supply/BAT0/capacity)
    set battery_status (cat /sys/class/power_supply/BAT0/status)

    if test "$battery_status" != "Charging"
        and test $battery_percentage -lt $threshold
        notify-send "Low battery warning" "Battery is at $battery_percentage%" --urgency=normal --icon=battery-low --expire-time=5000
    end
    sleep 60
end
