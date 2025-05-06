.PHONY: brew bundle stow init

# Bootstrap commands
init: bundle stow ssh
	@echo "✅ Environment setup complete"

stow: | /opt/homebrew/bin/stow
	stow --dotfiles home

bundle: | /opt/homebrew/bin/brew
	brew bundle install

ssh:
	ssh-keygen -t ed25519 -f $(HOME)/.ssh/id_ed25519 -N ""
	eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519
	pbcopy < ~/.ssh/id_ed25519.pub

# Binary files we need
/opt/homebrew/bin/stow: bundle

/opt/homebrew/bin/brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
