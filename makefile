UPDATE_CONFIGS := \
  git reset --hard
  git pull

SYMLINK_CHECK := \
	ln -sf $(pwd)/configs/config/nvim ~/.configs/nvim
	ln -sf $(pwd)/configs/config/ranger ~/.configs/ranger
	ln -sf $(pwd)/configs/tmux ~/.tmux
	ln -sf $(pwd)/configs/tmux/tmux.conf ~/.tmux.conf

# NVIM_UPDATE := \
# # Load nvim config targeting to this config directory
# # Cant find a way to override config directory on mac

update:
	$(UPDATE_CONFIGS)
	$(SYMLINK_CHECK)
	# $(NVIM_UPDATE)
