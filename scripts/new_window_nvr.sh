#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/common.sh"

create_window_nvr() {
  next_file_name=$(next_nvimsocket_filename)
  tmux new-window -c "#{pane_current_path}" -e NVIM_LISTEN_ADDRESS="$next_file_name"
}

main() {
  create_window_nvr
}

main
