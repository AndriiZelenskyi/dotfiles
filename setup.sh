#! /bin/bash

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

echo "Copying tmux configurations..."
if [ -f ~/.tmux.conf ]; then
    echo "Local tmux config already exists. Deleting..."
    rm ~/.tmux.conf
fi
echo "Creating new tmux config..."
if [[ ! -d ~/.config/tmux ]]; then
    echo "Creating new tmux directory..."
    mkdir ~/.config/tmux
fi
rm -rf ~/.config/tmux
cp -r ./config/tmux ~/.config/tmux
cp ./config/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf


echo "Copying neovim configurations..."
if [ -f ~/.config/nvim/init.vim ]; then
    echo "Local neovim config already exists. Deleting..."
    rm -rf ~/.config/nvim
fi

cp -r ./config/nvim ~/.config/nvim

# if [[ -d ~/.zshrc ]]; then
#     echo "Local .zshrc already exists. Moving to .zshrc.bak"
#     mv ~/.zshrc ~/.zshrc.bak
#     rm ~/.zshrc
# fi
# ln ./config/.zshrc ~/.zshrc



