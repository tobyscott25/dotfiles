# Arch Linux Desktop

## Installation

*Automated `./install.sh` script coming soon.*

1. Boot from the installation media, run the installer with the following command, and reboot when prompted to.
```
# archinstall guided
```
- Fun fact: This is a python script so `$ python -m archinstall guided` works too!

2. Now we are booted from the newly installed system, let's set it up! Set the timezone:
```
$ sudo ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
```
3. Run `hwclock` to generate `/etc/adjtime`:
```
$ sudo hwclock --systohc
```
4. Install a CLI text editor
```
$ sudo pacman -S vim
```
5. **Uncomment the following lines** in `/etc/locale.gen` with vim (run as superuser). This tells the system what locales it needs to generate.
```
en-AU.UTF-8 UTF-8
en-AU ISO-8859-1
```
6. Generate the locales from `/etc/locale.gen`:
```
$ sudo locale-gen
```
7. List the available locales to check they were generated correctly:
```
$ localectl list-locales
```
8. Set the system locale. Write the `LANG` variable to `/etc/locale.conf` where `en_US.UTF-8` belongs to the first column of an uncommented entry in `/etc/locale.gen`. This command will do the trick, nice and easy:
```
$ sudo localectl set-locale LANG=en_AU.UTF-8
```
- Once the system and user `locale.conf` files have been created or edited, their new values will only take effect in the next session. To have the current session use the new settings, unset `LANG` and then source `/etc/profile.d/locale.sh`:
```
$ unset LANG
$ source /etc/profile.d/locale.sh
```
- Check the current locale:
```
$ locale
```
9. Install basic CLI packages required for the next steps:
```
$ sudo pacman -S base-devel git
```
10. Install paru, an AUR helper:
```
$ git clone https://aur.archlinux.org/paru.git
$ cd paru
$ makepkg -si
```
- Note: when you run `$ paru` without any options, it will automatically add the `-Syu` flags and update your system. This is equivalent to `$ sudo pacman -Syu`
11. Install the graphics server and the required GPU drivers. We want to run GUI programs right?!
```
$ sudo pacman -S xorg xorg-xinit
$ sudo pacman -S nvidia nvidia-utils        # NVIDIA
$ sudo pacman -S xf86-video-amdgpu mesa     # AMD
$ sudo pacman -S xf86-video-intel mesa      # INTEL
```
12. Install the window manager, toolbar, program launcher, terminal emulator, file manager, and font that will make up our environment.
```
$ sudo pacman -S i3-gaps rofi alacritty nemo ttc-iosevka 
$ paru -S polybar
```
- ***This following part is only required if you aren't using my dotfiles which have this already configured. But it's worth reading at least, to understand whats going on:***
- Create `~/.xinitrc` so we can make changes to the default config:
```
$ cp /etc/X11/xinit/xinitrc ~/.xinitrc
```
- and tell it to execute i3 when the Xserver is launched by editing it with vim to comment out the following lines and add `exec i3`:
```
#twm &
# ...
#exec xterm ...

exec i3
```
- Good, now the default terminal used by i3 is `xterm` but we have installed alacritty, so we need to tell i3 to launch alacritty instead when the keybind is used. Open `~/.config/i3/config` with vim and find the line `bindsym $mod+Return exec xterm` and replace `xterm` with `alacritty`
```
bindsym $mod+Return exec alacritty
```
- *Like I said before, **editing `~/.xinitrc` and `~/.config/i3/config` is only necessary if you are not using my dotfiles** because I have already configured them in my dotfiles.*

13. Now we are ready to start i3! Run `$ startx` to launch i3. On your first time i3 will prompt you to choose a "modifier" key, this key is used in keybindings to navigate and use i3. Choose what is most comfortable for you. Now use MOD+Return keybind (as we configured before) to open Alacritty. We have a terminal emulator window running on a GUI interface! But yikes, not very pretty is it? Let's fix that.

14. Run `$ xrandr` to see available screen resolutions. Set it like this: (feel free to try a few different resolutions to find the best one for your screen, for me 2560x1440 is best.)
```
$ xrandr -s 2560x1440
```

15. Now lets install an audio manager, a compositor for opacity control and other graphical features, an image viewer to draw the wallpaper, a GTK theme, an icon theme, and a program to select those themes.
```
$ sudo pacman -S alsa-utils picom feh deepin-icon-theme lxappearance
$ paru -S orchis-theme-git
```

16. Run `lxappearance` and choose the widget theme to be `Orchis-dark` and the icon theme and cursor theme to be `bloom`. Hit [Apply] in the bottom right.




17. Let's install some software.
```
$ sudo pacman -S neofetch bashtop firefox ttf-droid github-cli alsa-utils numlockx flameshot
$ paru -S visual-studio-code-bin
```

18. We're pretty much done, all that's left to do is copy across the config files now! Copy `.asoundrc`, `.bash_profile`, `.bashrc` and `.xinitrc` to `~/`, and copy everything in the `.config` directory to `~/.config/`.
- **Note: There will most likely be existing files in these places.** It is a good idea to back up the original config files just in case, but you should be fine to just **overwrite them unless you already have custom configs you don't want to lose**.

19. Reboot your system and enjoy!

- Note: If you don't have any sound you might have to run `$ alsamixer` and unmute some channels.