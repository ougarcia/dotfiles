.PHONY: brew bundle stow init

# Bootstrap commands

init: brew bundle stow
	@echo "✅ Environment setup complete"

stow: | /opt/homebrew/bin/stow
	stow --dotfiles home

bundle: | /opt/homebrew/bin/brew
	brew bundle install

brew: | /opt/homebrew/bin/brew

# Binary files we need

/opt/homebrew/bin/stow: | /opt/homebrew/bin/brew
	brew install stow

/opt/homebrew/bin/brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
