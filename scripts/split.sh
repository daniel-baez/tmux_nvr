#!/usr/bin/env bash

main() {
  window_id=$(tmux display-message -p '#{window_id}')
  filename=$(tmux show-option -gqv "@nvr.filename.$window_id")
  tmux split-window $@ "#{pane_current_path}" -e NVIM_LISTEN_ADDRESS="$filename"
}

main $@

