#!/usr/bin/env bash
# vim: set filetype=bash

random() {
  LC_ALL=C; cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

next_nvimsocket_filename() {
  session_name=$(tmux display-message -p '#S')
  window_index=$(tmux display-message -p '#I')
  id=$(random 6)

  echo "/tmp/nvimsocket-$id$-$session_name-$window_index"
}

# installs binding for C-a c
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind c run "$CURRENT_DIR/scripts/new_window_nvr.sh"

tmux set-env NVIM_LISTEN_ADDRESS "$(next_nvimsocket_filename)"

echo "10 NVIM_LISTEN_ADDRESS: $NVIM_LISTEN_ADDRESS"
# sets inital value for the required env variable
export NVIM_LISTEN_ADDRESS="$(next_nvimsocket_filename)"

echo "20 NVIM_LISTEN_ADDRESS: $NVIM_LISTEN_ADDRESS"

