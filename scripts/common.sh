#!/usr/bin/env bash

random() {
  LC_ALL=C; cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

next_nvimsocket_filename() {
  session_name=$(tmux display-message -p '#S')
  window_index=$(tmux display-message -p '#I')
  id=$(random 6)

  echo "/tmp/nvimsocket-${id}-${session_name}-${window_index}"
}

