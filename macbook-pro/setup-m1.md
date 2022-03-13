# Setting up my new MacBook with M1 Pro

## Installing Homebrew

```sh
# Install script

$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
```sh
# Add Homebrew to $PATH

$ echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile

$ eval $(/opt/homebrew/bin/brew shellenv)
```

## Fixing `$ npm install` not working

```sh
# Recompile all native Node.js addons as almost no one is shipping pre-built binaries for M1

$ arch -arm64 brew install pkg-config cairo pango jpeg giflib librsvg
```