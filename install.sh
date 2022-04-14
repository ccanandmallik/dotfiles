#!/bin/bash
set -e

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

# vim plug install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# tmux tpm install
if [ ! -d "$HOME/.tmux/plugins/tpm" ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# font install
brew install --cask font-fira-code-nerd-font font-fira-mono-nerd-font

ln -s -F ~/.vim_runtime/.alacritty.yml ~/.alacritty.yml
ln -s -F ~/.vim_runtime/crt.theme.json ~/crt.theme.json
ln -s -F ~/.vim_runtime/tmux.conf ~/.tmux.conf

echo "Installed dotfiles and more ⚡️⚡️⚡️"
