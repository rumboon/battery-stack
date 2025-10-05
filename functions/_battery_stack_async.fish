function _battery_stack_async --description 'Asynchronously get battery information'
    # Initialize battery info variables if not already set
    if not set -q _battery_stack_init
        set -g _battery_stack_init true
        set -g _battery_stack_data _battery_stack_data_$fish_pid

        # Set up variable watcher for battery info updates
        function $_battery_stack_data --on-variable $_battery_stack_data
            commandline --function repaint
        end
    end

    # Kill any previous battery info process
    command kill $_battery_last_pid 2>/dev/null

    # Start async battery info generation using worker function
    fish --private -c "_battery_stack_worker $_battery_stack_data" & disown

    set -g _battery_last_pid $last_pid
end