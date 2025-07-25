#!/bin/sh

set -eu

OS=$(uname)

export CYGWIN=winsymlinks:native

mkdir -p "$HOME"/.config/fish
mkdir -p "$HOME"/.config/kitty
mkdir -p "$HOME"/.config/ghostty

if [ "$OS" = "Darwin" ]; then
    ln -sfv "$HOME"/dotfiles/kitty.macos.conf "$HOME"/.config/kitty/kitty.conf
else
    ln -sfv "$HOME"/dotfiles/kitty.conf "$HOME"/.config/kitty/kitty.conf
fi

ln -sfv "$HOME"/dotfiles/ghostty.conf "$HOME"/.config/ghostty/config
ln -sfv "$HOME"/dotfiles/config.fish "$HOME"/.config/fish
#ln -sfv "$HOME"/dotfiles/.gdbinit "$HOME"
ln -sfv "$HOME"/dotfiles/.gitconfig "$HOME"
ln -sfv "$HOME"/dotfiles/.npmrc "$HOME"
ln -sfv "$HOME"/dotfiles/.pythonrc "$HOME"
ln -sfv "$HOME"/dotfiles/.radare2rc "$HOME"
ln -sfv "$HOME"/dotfiles/.tmux.conf "$HOME"
ln -sfv "$HOME"/dotfiles/.vimrc "$HOME"
