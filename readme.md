## Goal
This project follows goal to have one liner script that will install user friendly cli tools to work on any server with a pleasure.

## Installation
```

rm -rf ~/.common-dotfiles
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
`[` - Escape sequence to move cursor all around the current window <br>
`e` - Edit current tmux config <br>
`r` - Source current tmux config <br>
**Splits**
`_` - vertical split <br>
`-` - horisontal split <br>
`!` - Detach split as a separate pane <br>
**Sessions**
`C` - Create new session <br>
`4` - Rename current session <br>
**Windows**
`{` - Move window left <br>
`}` - Move window right <br>
`space` - Switch window vertical/horizontal alight <br>
**Panes**
`c` - Create new pane <br>
`,` - Rename pane <br>
`arrows` - Move pane left\right <br>

### Neovim
Self-explanatory, one of the best solutions for editing text files. Especially configs
