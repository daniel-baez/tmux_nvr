#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# global variable
SESSION_NAME="$1"

source "$CURRENT_DIR/common.sh"

session_name_not_provided() {
	[ -z "$SESSION_NAME" ]
}

new_session() {
  tuple=$(tmux new-session -d -P -F '#{session_id},#{window_id},#{pane_id}' -s "$SESSION_NAME")

  session_id=$(echo $tuple | cut -f1 -d,)
  window_id=$(echo $tuple | cut -f2 -d,)
  pane_id=$(echo $tuple | cut -f3 -d,)

  next_file_name=$(next_nvimsocket_filename $SESSION_NAME $window_id)

  tmux set-option -g "@nvr.filename.${window_id}" $next_file_name
  tmux set-environment -t "=$SESSION_NAME" NVIM_LISTEN_ADDRESS $next_file_name
  tmux send-keys -t "$pane_id" "export NVIM_LISTEN_ADDRESS=$next_file_name" Enter ;\
  tmux send-keys -t "$pane_id" -R "clear && tmux clear-history" Enter ;\
}

create_new_tmux_session() {
	if session_name_not_provided; then
		exit 0
	elif session_exists_exact; then
		switch_to_session "$SESSION_NAME"
		display_message "Switched to existing session ${SESSION_NAME}" "2000"
	else
    new_session
		switch_to_session "$SESSION_NAME"
	fi
}

main() {
	create_new_tmux_session
}

main
