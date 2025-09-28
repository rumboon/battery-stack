# Battery Stack

Asynchronous battery information for Fish shell prompts.

## Features

- Shows battery level and charging status
- Only displays when battery is below 50%
- Different icons for charging vs discharging
- Runs asynchronously to avoid blocking your prompt
- Automatic cleanup on directory changes

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install rumboon/battery-stack
```

## Usage

The battery stack detection runs automatically when used by a compatible prompt. The detected information is stored in the `$_battery_stack_data` variable.

Manual usage:
```fish
_battery_stack_async
# Check the result
echo $_battery_stack_data
```

## Functions

- `_battery_stack_async` - Main async battery info function
- `_battery_stack_worker` - Background worker for battery detection
- `_battery_stack` - Core battery information function
- `_battery_stack_cleanup` - Cleanup function for processes and variables

## Icons

- 🪫 - Low battery (discharging)
- 🔌 - Charging
- ⚡ - Critical battery (< 20%)
