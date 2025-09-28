function _battery_stack_cleanup --description 'Clean up battery stack processes and variables'
    command kill $_battery_last_pid 2>/dev/null
    set --erase $_battery_stack_data
end

# Set up event handlers for cleanup
function _battery_stack_info_cleanup --on-variable PWD --on-event fish_exit
    _battery_stack_cleanup
end