#!/bin/sh

set -eu

export CYGWIN=winsymlinks:native

mkdir -p $HOME/.config/fish
mkdir -p $HOME/.config/kitty

ln -sfv $HOME/dotfiles/config.fish $HOME/.config/fish
ln -sfv $HOME/dotfiles/kitty.conf $HOME/.config/kitty
ln -sfv $HOME/dotfiles/.gdbinit $HOME
ln -sfv $HOME/dotfiles/.gitconfig $HOME
ln -sfv $HOME/dotfiles/.npmrc $HOME
ln -sfv $HOME/dotfiles/.pythonrc $HOME
ln -sfv $HOME/dotfiles/.radare2rc $HOME
ln -sfv $HOME/dotfiles/.tmux.conf $HOME
ln -sfv $HOME/dotfiles/.vimrc $HOME
