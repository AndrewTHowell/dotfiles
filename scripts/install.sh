#!/usr/bin/env bash

# Major credit to https://github.com/marcuscaisey/.dotfiles

# clone_or_pull <repo> <dir>
# Checks if repo exists already. If not, clone it. If it does, pull it.
clone_or_pull() {
    if [ ! -d "$2" ]; then
        git clone --depth 1 "$1" "$2"
    else
        git -C "$2" pull
    fi
}

echo "Updating package manager"
sudo apt update

packages="zsh git tmux ripgrep stow curl make cmake gcc"
echo "Installing required packages: $packages"
sudo apt install -y $pkgs

echo "Installing fzf (apt version is outdated)"
clone_or_pull https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --no-update-rc --no-bash
# Add the following to zsh:
## Set up fzf key bindings and fuzzy completion
#source <(fzf --zsh)

echo "Installing zsh"
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    ZSH=~/.oh-my-zsh ~/.oh-my-zsh/tools/upgrade.sh
fi

echo "Installing fonts"
sudo wget -P /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
sudo wget -P /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
sudo wget -P /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
sudo wget -P /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -fv

echo "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

echo "Installing tmux plugin manager"
clone_or_pull https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing nvim"
# Make a quick scratch dir
mkdir -p ~/scratch
# Clone/pull dir into scratch dir
clone_or_pull https://github.com/neovim/neovim ~/scratch/neovim
# Configure make to include debug info (neovim crash still provides backtrace) and to install in optional add-on area of linux for neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/opt/neovim 
# Install from the scratch dir
sudo make --directory ~/scratch/neovim install
# Symlink the binary over to local
sudo ln -sfv /opt/neovim/bin/nvim /usr/local/bin/nvim

echo "Restowing files"
~/dotfiles/scripts/restow.sh

echo "Installation complete"
exec zsh