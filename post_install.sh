#!/bin/bash
sed "s|\$HOME|$HOME|g" settings/coc-settings.json > ~/.config/nvim/coc-settings.json
# jdt-language-server-0.57.0-202006300904
rm -Rf ~/.config/coc/extensions/coc-java-data/server/*
cp -Rf softwares/jdt-server/* ~/.config/coc/extensions/coc-java-data/server/

# install Ag search for FZF
brew install the_silver_searcher

# install Rg for FZF
brew install ripgrep
