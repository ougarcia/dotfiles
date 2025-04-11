.PHONY: all tpm stow bundle brew

TPM_DIR := $(HOME)/.tmux/plugins/tpm

all: tpm
	@echo "✅ Environment setup complete"

$(TPM_DIR)/.git:
	@mkdir -p $(dir $(TPM_DIR))
	git clone https://github.com/tmux-plugins/tpm $(TPM_DIR)

tpm: link $(TPM_DIR)/.git
	@$(TPM_DIR)/bin/install_plugins

link: bundle
	stow --dotfiles home

bundle: brew
	brew bundle install

/opt/homebrew/bin/brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew: /opt/homebrew/bin/brew
