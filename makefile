# all:
#   cd $(~/.common-dotfiles) && ls; \
#   pwd;

UPDATE_CONFIGS :=  \
	git reset --hard; \
	git pull;

SYMLINK_CHECK := \
	ln -sf $(CURDIR)/configs/config/nvim ~/.configs/nvim;     \
	ln -sf $(CURDIR)/configs/config/ranger ~/.configs/ranger; \
	ln -sf $(CURDIR)/configs/tmux ~/.tmux;                    \
	ln -sf $(CURDIR)/configs/zshrc ~/.zshrc;                  \
	ln -sf $(CURDIR)/configs/tmux/tmux.conf ~/.tmux.conf;

NVIM_UPDATE := \
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage; \
	sudo mv nvim.appimage /usr/bin/nvim;                                                   \
	sudo chmod +x /usr/bin/nvim;
# # Load nvim config targeting to this config directory
# # Open nvim on overrided config to make :PlugUpdate


ROOT :=                                               \
	sudo cp -rf ./configs/tmux           /root/.tmux;    \
	sudo cp -rf ./configs/config/ranger/ /root/.config/; \
	sudo cp -rf ./configs/config/nvim/   /root/.config/; \
	sudo cp -rf ./configs/config/zshrc   /root/.zshrc;   \
	sudo ln -s /root/.tmux/tmux.conf     /root/.tmux.conf;


CLEAN := \
	rm -rf ~/.config/nvim ~/.config/ranger ~/.tmux ~/.tmux.conf ~/.zshrc;

update:
	$(UPDATE_CONFIGS)
	$(SYMLINK_CHECK)
	$(NVIM_UPDATE)

symlink:
	$(SYMLINK_CHECK)

root:
	$(ROOT)

nvim:
	$(NVIM_UPDATE)

clean:
	$(CLEAN)
