#!/usr/bin/env bash
# vim: set filetype=bash

# installs binding for C-a c
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/common.sh"

filename=$(next_nvimsocket_filename)

tmux bind c run "$CURRENT_DIR/scripts/new_window_nvr.sh"


