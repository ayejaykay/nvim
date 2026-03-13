#!/bin/bash

# Get the latest neovim (v12 at time of writing)

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update

sudo apt-get install neovim

cd ~

lls_dir = ~/lua-language-server

mkdir $lls_dir

sudo apt install ninja-build

git clone https://github.com/LuaLS/lua-language-server.git $lls_dir

cd $lls_dir 

chmod +x $lls_dir/make.sh

./make.sh

chmod +x $lls_dir/bin

export PATH="$PATH:$lls_dir/bin"

# Download JetBrainsMono nerd font for icon support
