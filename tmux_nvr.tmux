#!/usr/bin/env bash
# vim: set filetype=bash

# installs binding for C-a c
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux bind c run "$CURRENT_DIR/scripts/new_window_nvr.sh"


