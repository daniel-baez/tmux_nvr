# tmux neovim remote

This plugin takes pieces from [tmux-pain-control][1] and [tmux-sessionist][2]
its most notable features are:

- Makes very fast to "branch" to new panes, windows and sessions
- All new windows, panes and sessions preserve the current working directory of
  the issuing terminal
- Panes within the same window, get their unique-randomized env variable NVIM_LISTEN_ADDRESS
  this, combined with [neovim-remote][3] allows you to maintain only one vim instance per tmux window

Combined with [vim-rooter][4] this ends up emulating a sort of IDE experience.
Where from the editor (your vim instance) you can open a terminal standing at
the project's root folder (by means of vim-rooter) then issue a command like

```
find . -type f | xargs -n1 nvr
```

And have all those files open in the only vim instance running in the current
window.

### Bindings

Notice most of the bindings emulate vim cursor movements.

**Splitting panes & windows**

- `prefix + C`<br/>
  prompts for name and creates session
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

Newly created panes always have the same path and NVIM_LISTEN_ADDRESS as the original pane.
Newly created windows and sessions have a randomized NVIM_LISTEN_ADDRESS

### Prerequisites

- known to work on tmux v3.1 (2.9 doesn't take `split-window -e`)
- Have your nvim instance already running with neovim-remote
- Update your shell scripts so `env | grep NVIM_LISTEN_ADDRESS` prints nothing

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'daplay/tmux_nvr'

Hit `prefix + I` to fetch the plugin and source it.

You should now have all `pain-control` bindings defined.

Make sure to install list this plugin after [tmux-pain-control][1] and/or [tmux-session_name][2]

### Manual Installation

Clone the repo:

    $ git clone https://github.com/daplay/tmux_nvr ~/clone/path

Add this line to the bottom of `~/.tmux.conf`:

    run-shell ~/clone/path/tmux_nvr.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf


[1]: https://github.com/tmux-plugins/tmux-pain-control
[2]: https://github.com/tmux-plugins/tmux-sessionist
[3]: https://github.com/mhinz/neovim-remote
[4]: https://github.com/airblade/vim-rooter
