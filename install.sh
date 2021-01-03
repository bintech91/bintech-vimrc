#!/bin/sh
set -e

echo "Start install bintech vimrc"

echo "Backup ~/.vim_runtime"

cp -Rf ~/.vim_runtime ~/vim_runtime_bk

echo "Initialize ~/.vim_runtime"
rm -Rf ~/.vim_runtime
mkdir -p ~/.vim_runtime
cp -Rf . ~/.vim_runtime

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
