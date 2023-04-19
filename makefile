UPDATE_CONFIGS := \
  git reset --hard
  git pull

SYMLINK_CHECK := \
	ln -sf $(pwd)/configs/config/nvim ~/.configs/nvim
	ln -sf $(pwd)/configs/config/ranger ~/.configs/ranger
	ln -sf $(pwd)/configs/tmux ~/.tmux
	ln -sf $(pwd)/configs/tmux/tmux.conf ~/.tmux.conf

NVIM_UPDATE :=                                                                     \
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
	mv nvim.appimage /usr/bin/nvim                                                   \
	chmod +x /usr/bin/nvim                                                           \
# # Load nvim config targeting to this config directory
# # Open nvim on overrided config to make :PlugUpdate

update:
	$(UPDATE_CONFIGS)
	$(SYMLINK_CHECK)
	$(NVIM_UPDATE)

symlink
	$(SYMLINK_CHECK)

nvim
	$(NVIM_UPDATE)
