#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/common.sh"

new_window() {
  tmux new-window \
    -c "#{pane_current_path}" \
    -e NVIM_LISTEN_ADDRESS="$1" \
    -P -F '#{window_id}'
}

main() {
  next_file_name=$(next_nvimsocket_filename)
  next_window_id=$(new_window $next_file_name)
  tmux set-option -g "@nvr.filename.${next_window_id}" $next_file_name
}

main

