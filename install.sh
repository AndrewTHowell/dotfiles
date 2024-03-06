#!/usr/bin/env bash

sudo apt update

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
git config --global commit.gpgsign true
git config --global user.signingkey ~/.ssh/${ssh_filename}.pub


# Install curl? (The --output-dir option is available since curl 7.73.0)

# Install neovim from source

# Install zsh?

# Install Oh My Zsh


