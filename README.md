# My GNU/Linux config files

![kali-i3](screenshots/kali-i3-gaps.png)

## Installation

### Clone this repo

```bash
# Install git if it's not included in your distro
sudo pacman -S git

# Clone this repo
git clone https://github.com/tobyscott25/dotfiles.git
```

### Install Homebrew (MacOS-specific instructions)

```bash
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
```

### Install AUR helper (Arch-specific instructions)

```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
rm -rf paru
```

### Install the drivers for your hardware (Arch-specific instructions)
You may not need these at all, it's possible that your system will work out-of-the-box.
```bash
sudo pacman -S nvidia nvidia-utils      # NVIDIA 
sudo pacman -S xf86-video-amdgpu mesa   # AMD
sudo pacman -S xf86-video-intel mesa    # Intel
sudo pacman -S virtualbox-guest-utils	  # VirtualBox
```

### Install Iosevka Nerd Font

```bash
mkdir -p ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
unzip Iosevka.zip -d ~/.local/share/fonts/
rm -f Iosevka.zip
fc-cache -fv
```


### Install GitHub CLI (Debian-specific instructions)

```bash
# Add GitHub CLI to repo
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update

# Install it
sudo apt install gh
```

### Install Bashtop (Debian-specific instructions)

```bash
git clone https://github.com/aristocratos/bashtop.git

cd bashtop/DEB
sudo ./build
```


### Install Zsh (with Oh My Zsh & OMZ Plugins)

```bash
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
```

Edit `.zshrc`
1. Find this line and add the plugins, some are installed by default:
```
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search history dotenv aliases sudo themes brew colored-man-pages docker nmap)
```

2. Change `ZSH_THEME` from `bobbyrussel` to `af-magic`:
```env
ZSH_THEME="af-magic"
```

## Usage

### Changing the wallpaper in i3

Find this line in `.config/i3/config` and edit the path to the new wallpaper you want
```conf
# Wallpaper is drawn with 'feh'
exec_always feh --bg-fill $HOME/dotfiles/wallpapers/lofi/umbrella.jpg
```
