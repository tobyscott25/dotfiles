# Arch Linux Desktop

## About
This is my daily driver. This guide assumes a fresh installation of Arch Linux with an internet connection.

## Installation

### 1. Install the dependancies
```
$ sudo pacman -S vim git base-devel xorg xorg-xinit rofi alacritty nemo alsa-utils picom feh deepin-icon-theme lxappearance neofetch bashtop firefox ttf-droid github-cli alsa-utils numlockx flameshot zsh zsh-completions curl wget nodejs npm
$ git clone https://aur.archlinux.org/paru.git
$ cd paru
$ makepkg -si
$ cd ../
$ rm -rf paru
$ paru -S i3-gaps-rounded-git polybar orchis-theme-git visual-studio-code-bin google-chrome
```

Install the drivers for your hardware. You may not need these at all, it's possible that your system will work out-of-the-box.
```sh
$ sudo pacman -S nvidia nvidia-utils      # NVIDIA 
$ sudo pacman -S xf86-video-amdgpu mesa   # AMD
$ sudo pacman -S xf86-video-intel mesa    # Intel
```
If you are using VirtualBox, you may want to install the VirtualBox guest utilities. This is completely uncessary on a physical machine.
```
$ sudo pacman -S virtualbox-guest-utils
```

### 2. Copy across the config files
Whether you do this through the CLI or with a GUI file manager is up to you.
Copy `.config`, `wallpapers`, `.asoundrc`, `.bash_profile`, `.bashrc` and `.xinitrc` to your home directory.

***Reboot your system and enjoy!***

### 3. Adjustments (if required)
See available screen resolutions
```
$ xrandr
```
Set it like this *(2560x1440 is best for me)*
```
$ xrandr -s 2560x1440
```
To change the icon theme, cursor theme, GUI theme and font, run
```
$ lxappearance
```
I have mine set as:
- Widget theme: `Orchis-dark`
- Font: `Droid Sans` `Regular` `14`
- Icon theme: `bloom`
- Cursor theme: `bloom`

Change the wallpaper
```
$ vim .config/i3/config
```
Find this line and edit the path to the new wallpaper you want
```sh
# Set wallpaper with 'feh'    !! Previously set in ~/.xinitrc
exec_always feh --bg-fill $HOME/wallpapers/lofi/umbrella.jpg
```