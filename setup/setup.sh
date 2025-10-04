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


# there is a whole bunch of stuff i did to get the icons working.  
# you have to download the jetbrains mono font from the nerdfonts website, and then double click one of the fonts in the zip file to add it to the windows fonts.  then you have to set that in the default terminal settings for it to take hold in wsl.  you may have to change your cursor back too.
