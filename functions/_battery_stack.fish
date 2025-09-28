function _battery_stack --description 'Get battery level and status'
    set -l battery_level ""
    set -l battery_status ""

    # Try multiple methods to get battery info
    if test -f /sys/class/power_supply/BAT0/capacity
        set battery_level (cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
    else if test -f /sys/class/power_supply/BAT1/capacity
        set battery_level (cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)
    else if command -v acpi >/dev/null 2>&1
        set -l acpi_output (acpi -b 2>/dev/null | head -1)
        if test -n "$acpi_output"
            set battery_level (echo $acpi_output | string match -r '\d+' | head -1)
        end
    else if command -v upower >/dev/null 2>&1
        set -l upower_output (upower -i $(upower -e | grep 'BAT') 2>/dev/null | grep -E "percentage")
        if test -n "$upower_output"
            set battery_level (echo $upower_output | string match -r '\d+' | head -1)
        end
    end

    # Get charging status
    if test -f /sys/class/power_supply/BAT0/status
        set battery_status (cat /sys/class/power_supply/BAT0/status 2>/dev/null)
    else if test -f /sys/class/power_supply/BAT1/status
        set battery_status (cat /sys/class/power_supply/BAT1/status 2>/dev/null)
    end

    # Return battery level and status
    if test -n "$battery_level"
        echo "$battery_level:$battery_status"
    end
end