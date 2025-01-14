#! /bin/bash

if [[ -d ~/.local/share/nvim ]]; then
	echo "Found local neovim cache directory. Deleting..."
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
else
	echo "No neovim cache was found"
fi
