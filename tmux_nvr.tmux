#!/usr/bin/env bash
# vim: set filetype=bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/common.sh"

set_pane_split_bindings() {
  tmux bind-key "|" run "$CURRENT_DIR/scripts/split.sh -h -c"
  tmux bind-key "\\" run "$CURRENT_DIR/scripts/split.sh -fh -c"
  tmux bind-key "-" run "$CURRENT_DIR/scripts/split.sh -v -c"
  tmux bind-key "_" run "$CURRENT_DIR/scripts/split.sh -fv -c"
  tmux bind-key "%" run "$CURRENT_DIR/scripts/split.sh -h -c"
  tmux bind-key '"' run "$CURRENT_DIR/scripts/split.sh -v -c"
}

# Prompt for creating a new session. 
# If the session with the same name exists, it will switch to existing session.
set_new_session_binding() {
  tmux bind C run "$CURRENT_DIR/scripts/new_session_prompt.sh"
}

set_new_window_binding() {
  tmux bind c run "$CURRENT_DIR/scripts/new_window.sh"
}

main() {
  set_pane_split_bindings
  set_new_window_binding
  set_new_session_binding
}

main
