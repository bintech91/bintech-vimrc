#!/bin/sh
set -e

echo "Start install bintech vimrc"

echo "Backup ~/.vim_runtime to ~/vim_runtime_bk"

cp -Rf ~/.vim_runtime ~/vim_runtime_bk

echo "Initialize ~/.vim_runtime"
rm -Rf ~/.vim_runtime
mkdir -p ~/.vim_runtime
cp -Rf . ~/.vim_runtime

cd ~/.vim_runtime

if [ -z "$JAVA_HOME" ]; then
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "WARNING: JAVA_HOME is empty. Setup default JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 in .profile to use java plugins"
        echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.profile
        source ~/.profile

        echo "Install the_silver_searcher"
        sudo apt-get install silversearcher-ag

        echo "Install ripgrep"
        sudo apt-get install ripgrep
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        echo "WARNING: JAVA_HOME is empty. Setup default JAVA_HOME=`/usr/libexec/java_home` in .bash_profile to use java plugins"
        echo "export JAVA_HOME=`/usr/libexec/java_home`" >> ~/.bash_profile
        source ~/.bash_profile

        echo "Install the_silver_searcher"
        brew install the_silver_searcher
        echo "Install ripgrep"
        brew install ripgrep
    else
        # Unknown
        echo "WARNING: JAVA_HOME is empty. Please setup your JAVA_HOME to use java plugins"

    fi
fi

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
