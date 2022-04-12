# Clean Kali Linux

## About
If you do most of your work in a terminal (as is the case when using Kali), a tiling window manager is a no-brainer for that.

![kali-clean](screenshot.png)

## Installation

```sh
# Clone this repo to your home directory
$ git clone https://github.com/tobyscott25/dotfiles.git

# Change working directory to kali-clean
$ cd dotfiles/kali-clean

# Run the installer
$ ./install.sh
```

## Authenticating GitHub CLI
```sh
$ gh auth login
```

## Changing the wallpaper

```sh
$ vim .config/i3/config
```
Find this line and edit the path to the new wallpaper you want
```conf
# Set wallpaper with 'feh'    !! Previously set in ~/.xinitrc
exec_always feh --bg-fill $HOME/wallpapers/lofi/umbrella.jpg
```