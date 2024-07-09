#!/bin/bash

# make directory
makedir () {
  if [ ! -e $HOME/$1 ]; then
    mkdir $HOME/$1
  fi
}

makedir .config
makedir work
makedir .cargo
makedir .cargo/bin

# epel
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y

# tool
sudo dnf install exa ripgrep npm unzip wget tar util-linux-user zsh gcc gcc-c++ -y

# cargo-binstall
cd $HOME/work
wget https://github.com/cargo-bins/cargo-binstall/releases/latest/download/cargo-binstall-x86_64-unknown-linux-musl.tgz
tar -zxf cargo-binstall-x86_64-unknown-linux-musl.tgz
mv cargo-binstall $HOME/.cargo/bin/cargo-binstall

# rust-tool
export PATH=$PATH:~/.cargo/bin
cargo-binstall starship
cargo-binstall sheldon
cargo-binstall bat
cargo-binstall bottom
cargo-binstall dust
cargo-binstall duf
cargo-binstall bottom
cargo-binstall tree-sitter-cli

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
