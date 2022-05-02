#!/bin/bash

# Update repositiories and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install packages used
sudo apt install -y i3-gaps neofetch feh picom rofi polybar ranger kitty

# Install Iosevka Nerd Font
mkdir -p ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
unzip Iosevka.zip -d ~/.local/share/fonts/
rm -f Iosevka.zip
fc-cache -fv

# Add GitHub CLI to repo and install it
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Install Oh My Zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
# sh install.sh --unattended

# Clone zsh-autosuggestions and add to Oh My Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

# Install Bashtop
git clone https://github.com/aristocratos/bashtop.git
cd bashtop/DEB
sudo ./build

# Copy across config files
cp -r ~/dotfiles/wallpapers ~/wallpapers
cd ~/dotfiles/kali-clean/homedir
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
mkdir -p ~/.config
cp -r .config/i3 ~/.config/i3
cp -r .config/kitty ~/.config/kitty
cp -r .config/picom ~/.config/picom
cp -r .config/polybar ~/.config/polybar
# cp -r .config/rofi ~/.config/rofi
cp -r .config/ranger ~/.config/ranger


echo "Excellent! Now restart your machine and log into an i3 session."
