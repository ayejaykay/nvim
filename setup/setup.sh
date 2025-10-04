#!/bin/bash

cd ~

lls_dir = ~/lua-language-server

mkdir $lls_dir

sudo apt install ninja-build

git clone https://github.com/LuaLS/lua-language-server.git $lls_dir

cd $lls_dir 

./make.sh

chmod +x $lls_dir/bin

echo "export PATH=$PATH:$lls_dir/bin" >> ~/.profile

