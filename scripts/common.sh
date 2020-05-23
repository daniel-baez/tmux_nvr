#!/usr/bin/env bash

# tmux show-option "q" (quiet) flag does not set return value to 1, even though
# the option does not exist. This function patches that.
get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value=$(tmux show-option -gqv "$option")
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

random() {
  LC_ALL=C; cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

next_nvimsocket_filename() {
  session_name=${1:-$(tmux display-message -p '#S')}
  window_index=${2:-$(tmux display-message -p '#I')}

  # session_name=$(echo $session_name | sed -E -e 's/[^0-9]//g')
  window_index=$(echo $window_index | sed -E -e 's/[^0-9]//g')

  id=$(random 6)

  echo "/tmp/nvimsocket-${id}-${session_name}-${window_index}"
}

session_exists_exact() {
	tmux has-session -t "=${SESSION_NAME}" >/dev/null 2>&1
}

switch_to_session() {
	local session_name="$1"
	tmux switch-client -t "$session_name"
}

# Ensures a message is displayed for 5 seconds in tmux prompt.
# Does not override the 'display-time' tmux option.
display_message() {
	local message="$1"

	# display_duration defaults to 5 seconds, if not passed as an argument
	if [ "$#" -eq 2 ]; then
		local display_duration="$2"
	else
		local display_duration="5000"
	fi

	# saves user-set 'display-time' option
	local saved_display_time=$(get_tmux_option "display-time" "750")

	# sets message display time to 5 seconds
	tmux set-option -gq display-time "$display_duration"

	# displays message
	tmux display-message "$message"

	# restores original 'display-time' value
	tmux set-option -gq display-time "$saved_display_time"
}
