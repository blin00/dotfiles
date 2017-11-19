#!/bin/sh

export CYGWIN=winsymlinks:native

ln -sfv $HOME/dotfiles/config.fish $HOME/.config/fish
ln -sfv $HOME/dotfiles/.gitconfig $HOME
ln -sfv $HOME/dotfiles/.pythonrc $HOME
ln -sfv $HOME/dotfiles/.radare2rc $HOME
ln -sfv $HOME/dotfiles/.vimrc $HOME
