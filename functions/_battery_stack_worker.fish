function _battery_stack_worker --description 'Background worker function for battery stack generation'
    # Get the variable name from command line argument
    set battery_var_name $argv[1]

    # Colors
    set -l battery_color (set_color brred)
    set -l normal (set_color normal)

    # Get battery info using the existing function
    set battery_info (_battery_stack)
    set formatted_battery ""

    if test -n "$battery_info"
        set -l battery_parts (string split ":" $battery_info)
        set -l battery_level $battery_parts[1]
        set -l battery_status $battery_parts[2]

        if test "$battery_level" -lt $BATTERY_STACK_THRESHOLD
            # Choose icon based on level and status
            set -l battery_icon "🪫"
            if test "$battery_status" = "Charging"
                set battery_icon "🔌"
            else if test "$battery_level" -lt 20
                set battery_icon "⚡"
            end

            set formatted_battery "$battery_color$battery_icon $battery_level%$normal"
        end
    end

    # Set the universal variable to trigger repaint
    set --universal $battery_var_name $formatted_battery
end