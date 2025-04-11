.PHONY: brew bundle stow init

init: brew bundle stow
	@echo "✅ Environment setup complete"

stow:
	stow --dotfiles home

bundle:
	brew bundle install

brew: | /opt/homebrew/bin/brew

/opt/homebrew/bin/brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
