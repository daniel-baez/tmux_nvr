#!/usr/bin/env bash
# vim: set filetype=bash

# installs binding for C-a c
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/common.sh"

pane_split_bindings() {
  tmux bind-key "|" run "$CURRENT_DIR/scripts/split.sh -h -c"
  tmux bind-key "\\" run "$CURRENT_DIR/scripts/split.sh -fh -c"
  tmux bind-key "-" run "$CURRENT_DIR/scripts/split.sh -v -c"
  tmux bind-key "_" run "$CURRENT_DIR/scripts/split.sh -fv -c"
  tmux bind-key "%" run "$CURRENT_DIR/scripts/split.sh -h -c"
  tmux bind-key '"' run "$CURRENT_DIR/scripts/split.sh -v -c"
}

improve_new_window_binding() {
  tmux bind c run "$CURRENT_DIR/scripts/new_window_nvr.sh"
}

main() {
  pane_split_bindings
  improve_new_window_binding
}

main

