#!/bin/bash

if ! [ -x "$(command -v brew)" ]; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ ! -d /Applications/iTerm.app ]]; then
	echo "Installing iTerm2..."
	brew install --cask iterm2
fi

if [[ ! -d /Applications/Ghostty.app ]]; then
	echo "Installing Ghostty..."
	brew install --cask ghostty
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

if ! [ -x "$(command -v dark-notify)" ]; then
	echo "Installing dark-notify (drives tmux light/dark switching)..."
	brew tap cormacrelf/tap
	brew install cormacrelf/tap/dark-notify
fi

SHADERS_DIR="$HOME/.config/ghostty/shaders"
if [ ! -f "$SHADERS_DIR/cursor_sweep.glsl" ]; then
	echo "Fetching ghostty cursor shaders (sahaj-b/ghostty-cursor-shaders)..."
	mkdir -p "$SHADERS_DIR"
	tmpdir=$(mktemp -d)
	git clone --depth=1 https://github.com/sahaj-b/ghostty-cursor-shaders "$tmpdir/shaders"
	cp "$tmpdir/shaders"/*.glsl "$SHADERS_DIR/"
	rm -rf "$tmpdir"
fi

AGENT_SRC="$HOME/.config/tmux/com.user.tmux-theme-switcher.plist"
AGENT_DST="$HOME/Library/LaunchAgents/com.user.tmux-theme-switcher.plist"
if [ -f "$AGENT_SRC" ] && [ ! -L "$AGENT_DST" ]; then
	echo "Linking tmux theme-switcher launchd agent..."
	mkdir -p "$HOME/Library/LaunchAgents"
	ln -sfn "$AGENT_SRC" "$AGENT_DST"
	launchctl unload "$AGENT_DST" 2>/dev/null || true
	launchctl load "$AGENT_DST"
fi

echo "Finished installing all dependencies. Start installing requried packages using stow"
