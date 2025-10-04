# Should handle all of the external stuff to get the neovim environment set up. 
#
# This should handle things like
# 	- Installing packer (which might already be done in the lua script)
# 	- Installing language servers, and putting them in the right places to be utilized
# 		- clangd
# 		- pyright
# 		- lua-language-server
# 			- make sure this gets pulled down, extracted, made executable and then put in ~/.profile directory
#
# 	- There was some other fun stuff I had to do for the fuzzy finding to work well, but I forget what i did for that
