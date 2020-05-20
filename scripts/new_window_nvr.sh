#!/usr/bin/env bash

next_nvimsocket_filename() {
  session_name=$(tmux display-message -p '#S')
  window_index=$(tmux display-message -p '#I')
  id=$(random 6)

  echo "/tmp/nvimsocket-$id$-$session_name-$window_index"
}

create_window_nvr() {
  next_file_name=$(next_nvimsocket_filename)
  tmux new-window -c "#{pane_current_path}" -e NVIM_LISTEN_ADDRESS="$next_file_name"
}

main() {
  create_window_nvr
}

main
