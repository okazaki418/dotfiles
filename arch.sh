#!/bin/bash

# make directory
makedir () {
  if [ ! -e $HOME/$1 ]; then
    mkdir $HOME/$1
  fi
}

makedir .config
makedir work

# yay
yes | sudo pacman -S base-devel dust duf exa starship sheldon zsh ripgrep npm unzip wget bottom procs inetutils dnsutils sshpass bat diskonaut
wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay-bin.tar.gz
mv yay-bin.tar.gz $HOME/work
cd $HOME/work
tar -zxf yay-bin.tar.gz
cd yay-bin
makepkg -s
yes | sudo pacman -U yay-bin*

# $HOME/FILE
ln -snf $HOME/dotfiles/zshrc $HOME/.zshrc
ln -snf $HOME/dotfiles/latexmkrc $HOME/.latexmkrc

# $HOME/.zsh
ln -snf $HOME/dotfiles/zsh $HOME/.zsh

# $HOME/.config/sheldon
ln -snf $HOME/dotfiles/sheldon $HOME/.config/sheldon

# $HOME/.config/nvim
ln -snf $HOME/dotfiles/nvim $HOME/.config/nvim

# $HOME/.config/wezterm
ln -snf $HOME/dotfiles/wezterm $HOME/.config/wezterm
