# tmux neovim remote

Extends from tmux-pain-control. allows to share a single nvim
instance for each tmux window

### Bindings

Notice most of the bindings emulate vim cursor movements.

**Splitting panes & windows**

- `prefix + c`<br/>
  creates new window
- `prefix + |`<br/>
  split current pane horizontally
- `prefix + -`<br/>
  split current pane vertically
- `prefix + \`<br/>
  split current pane full width horizontally
- `prefix + _`<br/>
  split current pane full width vertically

Newly created panes always have the same path as the original pane plus same NVIM_LISTEN_ADDRESS
Newly created windows have a randomized NVIM_LISTEN_ADDRESS

### Prerequisites

- known to work on tmux v3.1 (2.9 doesn't take `split-window -e`)
- Have your nvim instance already running with neovim-remote
- Update your shell scripts so `env | grep NVIM_LISTEN_ADDRESS` prints nothing

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'daplay/tmux_nvr'

Hit `prefix + I` to fetch the plugin and source it.

You should now have all `pain-control` bindings defined.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/daplay/tmux_nvr ~/clone/path

Add this line to the bottom of `~/.tmux.conf`:

    run-shell ~/clone/path/tmux_nvr.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf


