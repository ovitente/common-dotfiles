UPDATE_COMMANDS := \
  git reset --hard
  git pull
	$(SYMLINK_CHECK)

SYMLINK_CHECK := \
	ln -sf $(pwd)/configs/config/nvim ~/.configs/nvim
	ln -sf $(pwd)/configs/config/ranger ~/.configs/ranger
	ln -sf $(pwd)/configs/tmux ~/.tmux
	ln -sf $(pwd)/configs/tmux/tmux.conf ~/.tmux.conf

update:
	$(DEPLOY_COMMANDS)

symlink
	$(SYMLINK_CHECK)
