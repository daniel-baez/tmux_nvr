#!/usr/bin/env bash
# vim: set filetype=bash

# installs binding for C-a c
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/common.sh"

filename=$(next_nvimsocket_filename)

tmux bind c run "$CURRENT_DIR/scripts/new_window_nvr.sh"
# tmux set-env NVIM_LISTEN_ADDRESS $filename
# echo "10 NVIM_LISTEN_ADDRESS: $NVIM_LISTEN_ADDRESS"
# echo "30 NVIM_LISTEN_ADDRESS: $NVIM_LISTEN_ADDRESS"

if [ ! -z ${TMUX+x} ] && [ -z ${NVIM_LISTEN_ADDRESS+x} ]; then 
  tmux send-keys "export NVIM_LISTEN_ADDRESS=$(next_nvimsocket_filename)" Enter
fi

