#!/usr/bin/env bash

# Apt
#sudo apt update

pkgs="zsh ripgrep stow curl make cmake gettext unzip"
sudo apt install $pkgs

# SSH
ssh_filename="id_ed25519"
if ! [ -f ~/.ssh/$ssh_filename ]; then
  echo "Cannot detect SSH key, generating a new one."

  ssh-keygen -t ed25519 -f ~/.ssh/$ssh_filename -N '' -C "andrewthomashowell@gmail.com" <<< y >/dev/null 2>&1

  # Ensure ssh-agent is running
  eval "$(ssh-agent -s) >/dev/null"

  ssh-add ~/.ssh/$ssh_filename

  echo "SSH key generated. The public key is '$(cat ~/.ssh/${ssh_filename}.pub)'"
fi


# Git
sudo apt upgrade git

git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/${ssh_filename}.pub
git config --global commit.gpgsign true
git config --global gpg.ssh.allowedSignersFile "~/.config/git/allowed_signers"
git config --global user.email "andrewthomashowell@gmail.com"


# Install curl? (The --output-dir option is available since curl 7.73.0)
 
#NeoVim
sudo mkdir -p /opt/neovim/src
sudo git clone --depth 1 --branch stable https://github.com/neovim/neovim.git /opt/neovim/src
sudo make -C /opt/neovim/src CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/opt/neovim
sudo make -C /opt/neovim/src install
sudo ln -fsv /opt/neovim/bin/nvim /usr/local/bin/nvim

# Install zsh?

# Install Oh My Zsh


