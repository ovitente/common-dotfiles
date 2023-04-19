## Goal
This project follows goal to have one liner script that will install user friendly cli tools to work on any server with a pleasure.

## Installation
```
git clone --depth 1 https://github.com/ovitente/common-dotfiles.git ~/.common-dotfiles
bash ~/.common-dotfiles/install
```

## Features

* **Neet cross-tools work between tmux, ranger and neovim**

### Ranger
Advanced, vim-like cli file manager with custom-improved user config that is easy to use.
* Unique config features
* Cross ranger instances copy-paste buffer _(for current user)_
* Pretty, code-colored file previews
* Icons of the items
* Search for files/directories with `fzf` by `df` keybind and `dF` to search for file conten.

### Tmux
Terminal window manager that significantly improves your debugging/setup productivity and will remain working even after your accidental disconnect.
* Applyed really informative, comfortable and neet color theme
* Modifyed keybinding to work with normal length of fingers.

#### Keybindings
`Super` keybind is `Ctrl+F`. Next will be only symbols of actions.
**Common**
`[` - Escape sequence to move cursor all around the current window
`e` - Edit current tmux config
`r` - Source current tmux config
**Splits**
`_` - vertical split
`-` - horisontal split
`!` - Detach split as a separate pane
**Sessions**
`C` - Create new session
`4` - Rename current session
**Windows**
`{` - Move window left
`}` - Move window right
`space` - Switch window vertical/horizontal alight
**Panes**
`c` - Create new pane
`,` - Rename pane
`arrows` - Move pane left\right

### Neovim
Self-explanatory, one of the best solutions for editing text files. Especially configs
