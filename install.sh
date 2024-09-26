#!/bin/bash

if [ -z "${DOTFILES_HOMEDIR_PATH+x}" ]; then
	echo "DOTFILES_HOMEDIR_PATH variable not set"
	exit 1
fi

ln -s $DOTFILES_HOMEDIR_PATH/.vimrc $HOME/.vimrc
ln -s $DOTFILES_HOMEDIR_PATH/.config/alacritty $HOME/.config/alacritty


