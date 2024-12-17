#!/bin/bash

rm -rf ./config/kitty/ ./config/nvim/
cp -r ~/.config/kitty ./config/
cp -r ~/.config/nvim ./config/
rm ./config/nvim/lazy-lock.json
