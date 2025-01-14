#!/bin/bash

if ! [ -x "$(command -v brew)" ]; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ ! -d /Applications/iTerm.app ]]; then
	echo "Installing iTerm2..."
	brew install --cask iterm2
fi

if ! [ -x "$(command -v git)" ]; then
	echo "Installing Git..."
	brew install git
fi

if ! [ -x "$(command -v zsh)" ]; then
	echo "Installing Zsh..."
	brew install zsh
fi

if ! [ -x "$(command -v tmux)" ]; then
	echo "Installing Tmux..."
	brew install tmux
fi

if ! [ -x "$(command -v nvim)" ]; then
	echo "Installing Neovim..."
	brew install neovim
fi

if ! [ -x "$(command -v fzf)" ]; then
	echo "Installing Fzf..."
	brew install fzf
fi

if ! [ -x "$(command -v rg)" ]; then
	echo "Installing Ripgrep..."
	brew install ripgrep
fi

if ! [ -x "$(command -v kitty)" ]; then
	echo "Installing Kitty"
	brew install kitty
fi

if ! [ -x "$(command -v lazygit)" ]; then
	echo "Installing LazyGit..."
	brew install lazygit
fi

if ! [ -x "$(command -v yazi)" ]; then
	echo "Installing Yazi..."
	brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font
fi

if ! type -a stow >&2; then
	echo "Installing Stow..."
	brew install stow
fi

echo "Finished installing all dependencies. Start installing requried packages using stow"
