# Battery Stack initialization
# This file is automatically loaded when Fish starts

# Initialize battery stack variables
set -g _battery_stack_initialized false

# Set battery display threshold (only show when below this percentage)
if not set -q BATTERY_STACK_THRESHOLD
    set -gx BATTERY_STACK_THRESHOLD 50
end