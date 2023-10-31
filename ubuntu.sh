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

# neovim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim build-essential ripgrep duf exa zoxide zsh unzip sshpass -y

# cargo-binstall
cd $HOME/work 
wget https://github.com/cargo-bins/cargo-binstall/releases/latest/download/cargo-binstall-x86_64-unknown-linux-musl.tgz
tar -zxf cargo-binstall-x86_64-unknown-linux-musl.tgz
mv cargo-binstall $HOME/.cargo/bin/cargo-binstall

# rust-tool
export PATH=$PATH:~/.cargo/bin
yes | cargo-binstall starship
yes | cargo-binstall sheldon
yes | cargo-binstall bat
yes | cargo-binstall bottom
yes | cargo-binstall du-dust
yes | cargo-binstall procs
yes | cargo-binstall diskonaut

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
